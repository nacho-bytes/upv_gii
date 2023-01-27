using TarongISW.Entities;
using TarongISW.Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace TarongISW.Services
{
    public class TarongISWService: ITarongISWService 
    {
        private readonly IDAL dal;

        public TarongISWService(IDAL dal)
        {
            this.dal = dal;
        }

        public void RemoveAllData()
        {
            dal.RemoveAllData();
        }

        public void Commit()
        {
            dal.Commit();
        }

        public void AddPerson(Person person)
        {
            // Restricción: No puede haber dos personas con el mismo DNI
            if (dal.GetById<Person>(person.Id) == null)
            {
                dal.Insert<Person>(person);
                dal.Commit();
            }
            else throw new ServiceException("Person with Id " + person.Id + " already exists.");
        }

        public void AddParcel(Parcel parcel)
        {
            // Restricción: No puede haber dos parcelas con el mismo nombre
            if(!dal.GetWhere<Parcel>(x=>x.Name == parcel.Name).Any())
            {
                dal.Insert<Parcel>(parcel);
                dal.Commit();
            }
            else throw new ServiceException("Parcel with Name " + parcel.Name + " already exists.");
        }

        public void AddTruck(Truck truck)
        {
            // Restricción: No puede haber dos camiones con la misma matrícula
            if (dal.GetById<Person>(truck.Id) == null)
            {
                dal.Insert<Truck>(truck);
				dal.Commit();
            }
            else throw new ServiceException("Truck with Id " + truck.Id + " already exists.");
        }

		// A partir de aquí vuestro código




    }
}
