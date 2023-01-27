module BookDataBase where
    type Person = String
    type Book = String
    type Database = [(Person,Book)]

    exampleBase :: Database
    exampleBase = [("Alicia", "El nombre de la rosa"),("Juan", "La hija del canibal"),("Pepe", "Odesa"),("Alicia", "La ciudad de las bestias")]

    obtain :: Database -> Person -> [Book]
    obtain dBase thisPerson = [ book | (person,book) <- dBase, person == thisPerson ]

    borrow :: Database -> Book -> Person -> Database
    borrow dBase thisBook thisPerson = dBase ++ [(thisBook, thisPerson)]

    return' :: Database -> (Person,Book) -> Database
    return' (dB:dBs) (thisPerson, thisBook)
        | dB == (thisPerson, thisBook) = dBs
        | otherwise = dB : return' dBs (thisPerson, thisBook)