-- Script to insert test data to the previous created tables.
IF EXISTS(SELECT name FROM sys.databases
WHERE name = 'CodeChallenge')

	BEGIN				
		INSERT INTO [CodeChallenge].[dbo].[User]
				([Id]
				,[FirstName]
				,[LastName])
		VALUES
				(113520944, 'Allan', 'Serrano'),
				(123454545, 'Sergio', 'Calvo'),
				(215454565, 'Angel', 'Giraldez');

		
		INSERT INTO [CodeChallenge].[dbo].[Project]
				([Id]
				,[StartDate]
				,[EndDate]
				,[Credits])
		VALUES
				(1, (SELECT GETDATE() - 300), (SELECT GETDATE() - 250), 2),
				(2, (SELECT GETDATE()) - 200, (SELECT GETDATE() - 150), 5),
				(3, (SELECT GETDATE()) - 100, (SELECT GETDATE() - 50), 4),
				(4, (SELECT GETDATE()) + 100, (SELECT GETDATE() + 150), 6),
				(5, (SELECT GETDATE()) + 200, (SELECT GETDATE() + 250), 8),

				(6, (SELECT GETDATE() - 300), (SELECT GETDATE() - 250), 2),
				(7, (SELECT GETDATE()) - 200, (SELECT GETDATE() - 150), 5),
				(8, (SELECT GETDATE()) - 100, (SELECT GETDATE() - 50), 4),
				(9, (SELECT GETDATE()) + 100, (SELECT GETDATE() + 150), 6),
				(10, (SELECT GETDATE()) + 200, (SELECT GETDATE() + 250), 8);
		
		INSERT INTO [CodeChallenge].[dbo].[UserProject]
				([UserId]
				,[ProjectId]
				,[IsActive]
				,[AssignedDate])
		VALUES
				(113520944, 1, 1, (SELECT GETDATE() - 350)),
				(113520944, 2, 1, (SELECT GETDATE() - 200)),
				(113520944, 3, 1, (SELECT GETDATE() - 300)),
				(113520944, 4, 0, (SELECT GETDATE() - 350)),
				(113520944, 5, 1, (SELECT GETDATE() - 150)),

				(123454545, 6, 1, (SELECT GETDATE() - 350)),
				(123454545, 7, 1, (SELECT GETDATE() - 200)),
				(123454545, 3, 1, (SELECT GETDATE() - 300)),
				(123454545, 8, 0, (SELECT GETDATE())),
				(123454545, 10, 1, (SELECT GETDATE() + 150)),
				
				(215454565, 6, 1, (SELECT GETDATE() - 350)),
				(215454565, 5, 1, (SELECT GETDATE() + 100)),
				(215454565, 3, 0, (SELECT GETDATE() - 50)),
				(215454565, 4, 0, (SELECT GETDATE() - 350)),
				(215454565, 8, 1, (SELECT GETDATE() + 50));		
END