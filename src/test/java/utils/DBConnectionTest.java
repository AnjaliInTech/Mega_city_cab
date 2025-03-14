package utils;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class DBConnectionTest {

    @Test
    public void testGetConnection() {
        Connection connection = null;
        try {
            // Attempt to get a connection
            connection = db_connection.getConnection();
            
            // Assert that the connection is not null
            assertNotNull("Connection should not be null", connection);
            
            System.out.println("Connection to the database successful!");
        } catch (SQLException e) {
            // Fail the test if an exception occurs
            fail("Failed to connect to the database: " + e.getMessage());
        } finally {
            // Close the connection
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Connection closed.");
                } catch (SQLException e) {
                    System.err.println("Error closing the connection: " + e.getMessage());
                }
            }
        }
    }
}