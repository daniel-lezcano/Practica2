
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2021 17:07:53
-- Generated from EDMX file: C:\Users\BAXTEW\source\repos\ORMPrac2\Model\DB2Entity.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AGENTSSet'
CREATE TABLE [dbo].[AGENTSSet] (
    [AGENT_CODE] int IDENTITY(1,1) NOT NULL,
    [AGENT_NAME] nvarchar(max)  NOT NULL,
    [WORKING_AREA] nvarchar(max)  NOT NULL,
    [COMMISION] decimal(18,3)  NOT NULL,
    [PHONE_NO] nvarchar(max)  NOT NULL,
    [COUNTRY] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CUSTOMERSet'
CREATE TABLE [dbo].[CUSTOMERSet] (
    [CUST_CODE] int IDENTITY(1,1) NOT NULL,
    [CUST_NAME] nvarchar(max)  NOT NULL,
    [CUST_CITY] nvarchar(max)  NOT NULL,
    [WORKING_AREA] nvarchar(max)  NOT NULL,
    [CUST_COUNTRY] nvarchar(max)  NOT NULL,
    [GRADE] smallint  NOT NULL,
    [OPENING_AMT] decimal(18,0)  NOT NULL,
    [RECEIVE_AMT] decimal(18,0)  NOT NULL,
    [PAYMENT_AMT] decimal(18,0)  NOT NULL,
    [OUTSATNDING_AMT] decimal(18,0)  NOT NULL,
    [PHONE_NO] nvarchar(max)  NOT NULL,
    [AGENTS_CODE] int  NOT NULL
);
GO

-- Creating table 'ORDERSSet'
CREATE TABLE [dbo].[ORDERSSet] (
    [ODER_NUM] int IDENTITY(1,1) NOT NULL,
    [ORD_AMOUNT] decimal(18,0)  NOT NULL,
    [ADVANCE_AMOUNT] decimal(18,0)  NOT NULL,
    [ORD_DATE] datetime  NOT NULL,
    [ORD_DESCRIPTION] nvarchar(max)  NOT NULL,
    [CUST_CODE] int  NOT NULL,
    [AGENT_CODE] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AGENT_CODE] in table 'AGENTSSet'
ALTER TABLE [dbo].[AGENTSSet]
ADD CONSTRAINT [PK_AGENTSSet]
    PRIMARY KEY CLUSTERED ([AGENT_CODE] ASC);
GO

-- Creating primary key on [CUST_CODE] in table 'CUSTOMERSet'
ALTER TABLE [dbo].[CUSTOMERSet]
ADD CONSTRAINT [PK_CUSTOMERSet]
    PRIMARY KEY CLUSTERED ([CUST_CODE] ASC);
GO

-- Creating primary key on [ODER_NUM] in table 'ORDERSSet'
ALTER TABLE [dbo].[ORDERSSet]
ADD CONSTRAINT [PK_ORDERSSet]
    PRIMARY KEY CLUSTERED ([ODER_NUM] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AGENTS_CODE] in table 'CUSTOMERSet'
ALTER TABLE [dbo].[CUSTOMERSet]
ADD CONSTRAINT [FK_AGENTSCUSTOMER]
    FOREIGN KEY ([AGENTS_CODE])
    REFERENCES [dbo].[AGENTSSet]
        ([AGENT_CODE])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AGENTSCUSTOMER'
CREATE INDEX [IX_FK_AGENTSCUSTOMER]
ON [dbo].[CUSTOMERSet]
    ([AGENTS_CODE]);
GO

-- Creating foreign key on [CUST_CODE] in table 'ORDERSSet'
ALTER TABLE [dbo].[ORDERSSet]
ADD CONSTRAINT [FK_CUSTOMERORDERS]
    FOREIGN KEY ([CUST_CODE])
    REFERENCES [dbo].[CUSTOMERSet]
        ([CUST_CODE])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CUSTOMERORDERS'
CREATE INDEX [IX_FK_CUSTOMERORDERS]
ON [dbo].[ORDERSSet]
    ([CUST_CODE]);
GO

-- Creating foreign key on [AGENT_CODE] in table 'ORDERSSet'
ALTER TABLE [dbo].[ORDERSSet]
ADD CONSTRAINT [FK_AGENTSORDERS]
    FOREIGN KEY ([AGENT_CODE])
    REFERENCES [dbo].[AGENTSSet]
        ([AGENT_CODE])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AGENTSORDERS'
CREATE INDEX [IX_FK_AGENTSORDERS]
ON [dbo].[ORDERSSet]
    ([AGENT_CODE]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------