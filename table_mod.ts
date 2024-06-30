// To create an interface for the Authors Table
interface Authors {
    Author_ID: number;
    Author_Name: string;
    DOB: string; 
    Book_Genre: string;
  }
  
  // To create an interface to define the CRUD Operations
  interface AuthorService {
    createAuthor:(author: Authors)=> void;
   // getAuthorById:(authorId: number)=> Authors;
    //updateAuthor:(author: Authors)=> void;
    //deleteAuthor:(authorId: number)=> void;
  }
  
  // Class to execute the CRUD interface
class AuthorServiceImpl implements AuthorService {
     createAuthor:(author: Authors)=> void {
        const query = `INSERT INTO Authors ({author.Author_ID}, {author.Author_Name}, {author.DOB},(author.Book_Genre}) VALUES (1001,'J K ROWLING','26 -06 -1997','FANTASY')`;
      }
}