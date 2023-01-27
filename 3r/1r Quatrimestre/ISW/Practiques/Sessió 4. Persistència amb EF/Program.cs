 using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using GestDep.Entities;
using GestDep.Persistence;

namespace DBTest
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                EntityFrameworkDAL dal = new EntityFrameworkDAL(new GestDepDbContext());

                new Program(dal);


            }catch(Exception e)
            {
                printError(e);
                Console.WriteLine("Press any key.");
                Console.ReadLine();
            }

        }

        public Program(IDAL dal)
        {
            createSampleDB(dal);
            Console.WriteLine("\n\n\n");
            displayData(dal);
        }

        static void printError(Exception e)
        {
            while (e != null)
            {
                if (e is DbEntityValidationException)
                {
                    DbEntityValidationException dbe = (DbEntityValidationException)e;

                    foreach (var eve in dbe.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                                ve.PropertyName,
                                eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                                ve.ErrorMessage);
                        }
                    }
                }
                else
                {
                    Console.WriteLine("ERROR: " + e.Message);
                }
                e = e.InnerException;
            }
        }

        private void createSampleDB(IDAL dal)
        {
			// Remove all data from DB
			dal.RemoveAllData();

			Console.WriteLine("Creando los datos y almacenándolos en la BD.");
			Person p1 = new Person("12345678Z", "Juan Abelló");
			dal.Insert<Person>(p1);
			dal.Commit();
			
			Parcel parcel = new Parcel("1234567AB9999C0001DE", "El Lobillo, Alhambra (Ciudad Real)", Product.Kiwi, 10000, p1);
			dal.Insert<Parcel>(parcel);
			p1.Parcels.Add(parcel);
			dal.Commit();
			
			// Populate here the rest of the database with data

        }

        private void displayData(IDAL dal)
        {
            
            Console.WriteLine("Accediendo a los datos almacenados.");

            Console.WriteLine("\nPeople");
            foreach (Person p in dal.GetAll<Person>())
            {
                Console.WriteLine("   " + p.Name + ", " + p.Id);
            }

            Console.WriteLine("\nParcels");
            foreach (Parcel parcel in dal.GetAll<Parcel>())
            {
                Console.WriteLine("   " + parcel.Name + ", " + parcel.Owner.Name);
            }

        // Display here the information stored in the rest of the database tables

    }
}
