import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> String in
        return "You Are Here!"
    }
}