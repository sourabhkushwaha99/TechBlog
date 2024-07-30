Based on the structure and content of the TechBlog project, here is a comprehensive README file:

---

# TechBlog

TechBlog is a Java-based web application designed to facilitate blogging. Users can register, log in, create posts, edit their profiles, and interact with other users' posts through likes. The application leverages servlets and JSPs to handle web requests and render dynamic content.

## Table of Contents

- [TechBlog](#techblog)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Technologies Used](#technologies-used)
  - [Project Structure](#project-structure)
  - [Setup and Installation](#setup-and-installation)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)

## Features

- User Registration and Authentication
- Post Creation, Editing, and Deletion
- Liking Posts
- User Profile Management

## Technologies Used

- Java
- JDBC
- Servlets
- JSP
- MySQL
- HTML/CSS
- JavaScript

## Project Structure

```plaintext
TechBlog/
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── tech/
│                   └── blog/
│                       ├── dao/
│                       │   ├── LikeDao.java
│                       │   ├── PostDao.java
│                       │   └── UserDao.java
│                       ├── entities/
│                       │   ├── Category.java
│                       │   ├── Message.java
│                       │   ├── Post.java
│                       │   └── User.java
│                       ├── helper/
│                       │   ├── ConnectionProvider.java
│                       │   └── Helper.java
│                       └── servlets/
│                           ├── AddPostServlet.java
│                           ├── EditServlet.java
│                           ├── LikeServlet.java
│                           ├── LoginServlet.java
│                           ├── LogoutServlet.java
│                           └── RegisterServlet.java
└── src/
    └── main/
        └── webapp/
            ├── index.jsp
            ├── profile.jsp
            └── register.jsp
```

### DAO Layer

- `LikeDao.java`: Handles database operations related to post likes.
- `PostDao.java`: Manages CRUD operations for posts.
- `UserDao.java`: Manages CRUD operations for users.

### Entity Classes

- `Category.java`: Represents a post category.
- `Message.java`: Handles message objects.
- `Post.java`: Represents a blog post.
- `User.java`: Represents a user.

### Helper Classes

- `ConnectionProvider.java`: Provides a database connection.
- `Helper.java`: Contains utility methods.

### Servlets

- `AddPostServlet.java`: Handles post creation.
- `EditServlet.java`: Handles post editing.
- `LikeServlet.java`: Manages post likes.
- `LoginServlet.java`: Handles user login.
- `LogoutServlet.java`: Manages user logout.
- `RegisterServlet.java`: Handles user registration.

### JSP Files

- `index.jsp`: Homepage displaying all posts.
- `profile.jsp`: User profile page.
- `register.jsp`: User registration page.

## Setup and Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/sourabhkushwaha99/TechBlog.git
   ```

2. **Import the project into your preferred IDE** (e.g., IntelliJ IDEA, Eclipse).

3. **Setup MySQL Database**:
   - Create a new database named `techblog`.
   - Import the provided `techblog.sql` file to create necessary tables.

4. **Configure Database Connection**:
   - Update the `ConnectionProvider.java` file with your MySQL database credentials.

5. **Build the Project**:
   - Build the project using Maven or your IDE's build tool.

6. **Deploy the Application**:
   - Deploy the WAR file to a servlet container like Apache Tomcat.

## Usage

- **Register a new user**: Navigate to the registration page and create a new account.
- **Login**: Use your credentials to log in.
- **Create a post**: Once logged in, you can create, edit, or delete your posts.
- **Like a post**: Interact with posts by liking them.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any inquiries, please contact:
- Sourabh Kushwaha: [sourabh@example.com](mailto:sourabh@example.com)

---

Feel free to customize this README file further as per your specific requirements.
