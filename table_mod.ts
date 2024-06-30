// To create an interface for the Authors Table
export interface Authors {
  Author_ID: number;
  Author_Name: string;
  DOB: string;
  Book_Genre: string;
}

// To create an interface to define the CRUD Operations
export default interface AuthorService {
  createAuthor: (author: Authors) => void;
  //insertAuthor: <T = unknown>(author:T,authorId: number)=> void;
  //getAuthorById:(authorId: number)=> Authors[];
  //updateAuthor:(author: Authors)=> void;
  //deleteAuthor:(authorId: number)=> void;
}

// Class to execute the CRUD interface- Create Operation
class AuthorsServiceImpl implements AuthorService {
  createAuthor(author: Authors): void {
    // Implementation for creating an author
    console.log(
      `Author with authorID: "${author.Author_ID}" and Name: "${author.Author_Name}" created....!`
    );
  }
}

const authorTable = new AuthorsServiceImpl();
authorTable.createAuthor({
  Author_ID: 1001,
  Author_Name: "J K ROWLING",
  DOB: "26-06-1976",
  Book_Genre: "FANTASY",
});
