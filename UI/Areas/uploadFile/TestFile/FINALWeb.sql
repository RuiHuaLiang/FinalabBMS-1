--����FINALWeb���ݿ�
create database FINALWeb

--�л���FINALWeb���ݿ�
use FINALWeb

--������Ϣ��Tbl_Message

--���	id	int	��	��
--����	title	nvarcher��50��	��	��
--����	content	ntext 	��	��
--����ʱ��	sendTime	datetime	��	��
--����	Atachment vachar

create table Tbl_Message(
	Id int constraint PK_Tbl_Message_Id primary key not null ,
	Title nvarchar(50) not null ,
	Content ntext not null ,
	Atachment varchar(50),
	SendTime datetime 
)

--������Ϣ��ϵ��Tbl_User_Message
--����	����	��������	����	�Ƿ�Ϊ��
--���	id	int	��	��
--�ռ��˱��	receiveId	int	��	��
--�����˱��	sendId	int 	��	��
--��Ϣ���	messageId	int	��	��
--�Ķ�	isRead	bit	��	��
--�ռ���ɾ��	receiveIsDelete	bit	��	��
--�ݸ�	isDraft	bit	��	��
--������ɾ��	sendIsDelete	bit	��	��

create table Tbl_User_Message(
	Id int constraint PK_Tbl_User_Message_Id primary key not null ,
	ReceiveId int not null ,
	SendId int not null ,
	MessageId int constraint FK_Tbl_User_Message_MessageId foreign key  references  Tbl_Message(Id) not null ,
	IsRead bit constraint DF_Tbl_User_Message_IsRead default(0) not null ,
	ReceiveIsDelete bit constraint DF_Tbl_User_Message_ReceiveIsDelete default(0) not null ,
	IsDraft bit constraint DF_Tbl_User_Message_IsDraft default(0) not null ,
	SendIsDelete bit constraint DF_Tbl_User_Message_SendIsDelete default(0) not null
)

--����ϵͳ��Ϣ��
--���	Id	int
--����Id	SendId	int
--����	Title	nvarchar(50)
--����	Content	ntext 
--����	Atachment	varchar(100)
--ʱ��	SendTime	datetime

create table SystemMessage(
	Id int  constraint PK_SystemMessage_Id primary key identity(1,1) not null ,
	SendId int not null ,
	Title nvarchar(100) not null ,
	Content ntext not null ,
	Atachment varchar(100) null ,
	SendTime datetime not null
)


--����������Ϣ�Ĵ洢���̲�����Ϣ usp_sendMessage

create proc usp_insertMessage

@Title nvarchar(50),
@Content ntext,
@Atachment varchar(50),
@SendTime datetime , 

@MesageId int out
as
begin
	insert into Tbl_Message(Title , Content ,  Atachment ,SendTime ) 
	values(@Title , @Content , @Atachment , @SendTime)
	
	set @MesageId=@@IDENTITY
end

--���Դ洢����
declare @st int 
exec usp_insertMessage @Title = '��ҵ����2' , @Content = '�������' , @Atachment = 'D:/text' , @SendTime = '2008-05-10' ,@MesageId = @st  output
print @st


--��ѯ������Ϣ����
select * from Tbl_Message


--�����洢���̷�����Ϣ usp_sendMessage

create proc usp_sendMessage
@ReceiveId int ,
@SendId int ,
@MessageId int 
as
begin
	insert into Tbl_User_Message(ReceiveId , SendId , MessageId ) 
	values(@ReceiveId , @SendId , @MessageId )
end

--���Դ洢����
exec usp_sendMessage @ReceiveId = 1 , @SendId = 1 , @MessageId = 11 --�ɹ�ִ��
exec usp_sendMessage @ReceiveId = 1 , @SendId = 1 , @MessageId = 20 --���Լ�����ܲ���


--�����洢���̲鿴��Ϣ usp_ViewMessage
create proc usp_ViewMessage
@ReceiveId int ,
@MessageCount int out
as 
begin
	select SendId , MessageId , IsRead  
	from Tbl_User_Message 
	where ReceiveId = @ReceiveId and ReceiveIsDelete = 0
	order by Id desc
	
	select @MessageCount = count(*) 
	from Tbl_User_Message 
	where ReceiveId = @ReceiveId and ReceiveIsDelete = 0 and IsRead = 0
end

--���Դ洢����
declare @MC int 
exec usp_ViewMessage @ReceiveId = 1 , @MessageCount = @MC output
print @MC

select * from Tbl_User_Message