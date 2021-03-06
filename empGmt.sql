USE [master]
GO
/****** Object:  Database [empMgt]    Script Date: 03/19/2020 11:23:27 AM ******/
CREATE DATABASE [empMgt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'empMgt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\empMgt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'empMgt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\empMgt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [empMgt] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empMgt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empMgt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empMgt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empMgt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empMgt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empMgt] SET ARITHABORT OFF 
GO
ALTER DATABASE [empMgt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [empMgt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empMgt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empMgt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empMgt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empMgt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empMgt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empMgt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empMgt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empMgt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [empMgt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empMgt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empMgt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empMgt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empMgt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empMgt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [empMgt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empMgt] SET RECOVERY FULL 
GO
ALTER DATABASE [empMgt] SET  MULTI_USER 
GO
ALTER DATABASE [empMgt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empMgt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empMgt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empMgt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [empMgt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [empMgt] SET QUERY_STORE = OFF
GO
USE [empMgt]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [empMgt]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateDepartment]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CreateDepartment](@name nvarchar(50))
AS
BEGIN
INSERT INTO Department(DepartmentName) VALUES(@name);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateEmp]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CreateEmp](@name nvarchar(50),@gender nvarchar(10)
,@dep int,@address nvarchar(100))
AS
BEGIN
	INSERT INTO employee([Name],[Gender],[DepartmentId],[Address])
	VALUES(@name,@gender,@dep,@address);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteDepartment](@id int)
AS
BEGIN
DELETE FROM  Department
WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteEmployee](@id int)
AS
BEGIN
	DELETE FROM employee 
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAll]
AS
BEGIN
	SELECT * FROM employee emp INNER JOIN Department dep
	ON emp.DepartmentId=dep.Id 
	ORDER BY [Name] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmplloyees]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllEmplloyees]
AS
BEGIN
	SELECT * FROM employee
	ORDER BY [Name] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDepartment](@id int)
AS
BEGIN

SELECT * FROM Department WHERE [Id]=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmplloyee]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmplloyee](@id int)
AS
BEGIN
	SELECT * FROM employee
	WHERE id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmplloyeeModel]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmplloyeeModel](@id int)
AS
BEGIN
	SELECT * FROM employee
	WHERE id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmployee](@id int)
AS
BEGIN
	SELECT * FROM employee emp INNER JOIN Department dep
	ON emp.DepartmentId=dep.Id
	WHERE emp.Id=@id
	ORDER BY [Name] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOnlyEmployee]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOnlyEmployee](@id int)
AS
BEGIN
	SELECT * FROM employee 
	WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetsDepartment]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetsDepartment]
AS
BEGIN

SELECT * FROM Department;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartment]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDepartment](@id int,@name nvarchar(50))
AS
BEGIN
UPDATE Department SET DepartmentName=@name
WHERE Id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmp]    Script Date: 03/19/2020 11:23:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateEmp](@id int,@name nvarchar(50),@gender nvarchar(10)
,@dep int,@address nvarchar(100))
AS
BEGIN
	UPDATE employee SET
	[Name]=@name,[Gender]=@gender,
	[DepartmentId]=@dep,[Address]=@address
	WHERE Id=@id;
END
GO
USE [master]
GO
ALTER DATABASE [empMgt] SET  READ_WRITE 
GO
