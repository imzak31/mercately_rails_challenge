# Mercately Rails Challenge

Welcome to the Mercately Rails Challenge! This application demonstrates a simple e-commerce platform with user authentication, product management, and order management functionalities. The app supports light and dark modes, a shopping cart, and PDF export for orders.

## Table of Contents

- [Mercately Rails Challenge](#mercately-rails-challenge)
    - [Table of Contents](#table-of-contents)
    - [Ruby Version](#ruby-version)
    - [System Dependencies](#system-dependencies)
    - [Configuration](#configuration)
    - [Database Creation](#database-creation)
    - [Database Initialization](#database-initialization)
    - [How to Run the Test Suite](#how-to-run-the-test-suite)
    - [Deployment Instructions](#deployment-instructions)
    - [Architecture](#architecture)
    - [Contributing](#contributing)
    - [License](#license)

## Ruby Version

This project uses Ruby version `3.2.2` and Rails `7.1.3.3`.

## System Dependencies

- PostgreSQL
- Redis (if using ActionCable or background jobs)
- Ruby 3.2.2
- Rails 7.1
- Tailwind CSS

## Configuration

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/mercately_rails_challenge.git
   cd mercately_rails_challenge
2. Install dependencies:
   ```sh
   bundle install
3. Create the database:
   ```sh
    rails db:create
    rails db:migrate
4. Seed the database:
    ```sh
    rails db:seed
5. Start the server:
   ```sh
   rails s
   
## How to Run the Test Suite

1. To run the test suite, run the following command:
    ```sh
    rspec
   
## Architecture

The application is built using Ruby on Rails and follows the MVC architecture. The app uses PostgreSQL as the database. The front end is built using Tailwind CSS.

## Contributing

Contributions are welcome! Please refer to the [contributing guidelines](CONTRIBUTING.md) for more information.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


