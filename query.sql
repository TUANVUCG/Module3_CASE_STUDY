create database class_mng;
use class_mng;

create table subject
(
    subjectId   int primary key AUTO_INCREMENT,
    subjectName varchar(50) not null
);

CREATE table teacher
(
    teacherId   int PRIMARY KEY AUTO_INCREMENT,
    name        varchar(50) not null,
    address     varchar(50) not null,
    email       varchar(50) not null,
    phoneNumber varchar(50) not null,
    dateOfBirth date        not null
);

create table class
(
    classId   int PRIMARY key AUTO_INCREMENT,
    className varchar(50) not null,
    teacherId int,
    CONSTRAINT fk_teacherId FOREIGN KEY (teacherId) REFERENCES teacher (teacherId)
);

create table student
(
    studentId   int PRIMARY KEY AUTO_INCREMENT,
    name        varchar(50) not null,
    address     varchar(50) not null,
    email       varchar(50) not null,
    phoneNumber varchar(50) not null,
    dateOfBirth date        not null,
    classId     int,
    CONSTRAINT fk_classId FOREIGN KEY (classId) REFERENCES class (classId)
);

create table marks
(
    mark      int,
    subjectId int,
    studentId int,
    CONSTRAINT fk_subId FOREIGN KEY (subjectId) REFERENCES subject (subjectId),
    CONSTRAINT fk_stuId FOREIGN KEY (studentId) REFERENCES student (studentId),
    CONSTRAINT pk_sub_stu PRIMARY KEY (subjectId, studentId)
);

create table user
(
    userId   int PRIMARY key AUTO_INCREMENT,
    userName varchar(50) not null UNIQUE,
    password varchar(50) not null,
    role     varchar(50) check (role = 'student' or role = 'teacher' or role = 'admin')
);

alter table student
    add column userId int unique,
    add CONSTRAINT fk_userId foreign key (userId) references user (userId)
;

alter table teacher
    add column userId int unique,
    add CONSTRAINT fk_userId_teacher foreign key (userId) references user (userId)
;

delimiter //
create procedure createNewStudent(in name_S varchar(50), address_S varchar(50), email_S varchar(50),
                                  phoneNumber_S varchar(50), dateOfBirth_S date, classId_S int)
begin
    insert into student(name, address, email, phoneNumber, dateOfBirth, classId)
        value (name_S, address_S, email_S, phoneNumber_S, dateOfBirth_S, classId_S);
end //
delimiter ;

delimiter //
create procedure editStudentById(in S_Id int, in name_S varchar(50), address_S varchar(50), email_S varchar(50),
                                 phoneNumber_S varchar(50), dateOfBirth_S date, classId_S int, userId_S int)
begin
    update student
    set name        = name_S,
        address     = address_S,
        email       = email_S,
        phoneNumber = phoneNumber_S,
        dateOfBirth = dateOfBirth_S,
        classId     = classId_S,
        userId      = userId_S
    where studentId = S_Id;
end //
delimiter ;

delimiter //
create procedure removeStudentById(in S_Id int)
begin
    delete
    from student
    where studentId = S_Id;
end //
delimiter ;

<<<<<<< HEAD
=======
call removeStudentById(?);
>>>>>>> 9d0f5bcd4c97e4d15526482a0cc9952ade04c72d

delimiter //
create procedure createNewTeacher(in name_T varchar(50), address_T varchar(50), email_T varchar(50),
                                  phoneNumber_T varchar(50), dateOfBirth_T date)
begin
    insert into teacher(name, address, email, phoneNumber, dateOfBirth)
        value (name_T, address_T, email_T, phoneNumber_T, dateOfBirth_T);
end //
delimiter ;

# 15h30 04/06/2021
#create student
delimiter //
create procedure createNewStudent(IN name_S varchar(50), IN address_S varchar(50),
                                  IN email_S varchar(50), IN phoneNumber_S varchar(50),
                                  IN dateOfBirth_S date, IN classId_S int)
begin
    insert into student(name, address, email, phoneNumber, dateOfBirth, classId)
        value (name_S, address_S, email_S, phoneNumber_S, dateOfBirth_S, classId_S);
end;
delimiter ;

# find student
delimiter //
create procedure find(IN name_S varchar(50))
begin
    select *
    from student
    where name like name_S;
end;
delimiter ;

# find student by name
delimiter //
create procedure findStudentName(IN name_S varchar(50))
begin
    select *
    from student
    where name like name_S;
end;
delimiter ;

# remove student by name
delimiter //
create procedure removeStudentById(IN S_Id int)
begin
    delete
    from student
    where studentId = S_Id;
end;
delimiter ;

<<<<<<< HEAD
delimiter //
create procedure createNewStudent(IN name_S varchar(50), IN address_S varchar(50),
                                  IN email_S varchar(50), IN phoneNumber_S varchar(50),
                                  IN dateOfBirth_S date, IN classId_S int)
begin
    insert into student(name, address, email, phoneNumber, dateOfBirth, classId)
        value (name_S, address_S, email_S, phoneNumber_S, dateOfBirth_S, classId_S);
end;
delimiter ;

# find student
delimiter //
create procedure find(IN name_S varchar(50))
begin
    select *
    from student
    where name like name_S;
end;
delimiter ;

# find student by name
delimiter //
create procedure findStudentName(IN name_S varchar(50))
begin
    select *
    from student
    where name like name_S;
end;
delimiter ;

# remove student by name
delimiter //
create procedure removeStudentById(IN S_Id int)
begin
    delete
    from student
    where studentId = S_Id;
end;
delimiter ;

=======
>>>>>>> 9d0f5bcd4c97e4d15526482a0cc9952ade04c72d
# update student by id
delimiter //
create procedure updateStudentById(IN S_Id int, IN name_S varchar(50), IN address_S varchar(50),
                                   IN email_S varchar(50), IN phoneNumber_S varchar(50),
                                   IN dateOfBirth_S date, IN classId_S int)
begin
    update student
    set name        = name_S,
        address     = address_S,
        email       = email_S,
        phoneNumber = phoneNumber_S,
        dateOfBirth = dateOfBirth_S,
        classId     = classId_S
    where studentId = S_Id;
end;

delimiter ;

<<<<<<< HEAD


=======
# TEACHER
# create new teacher
delimiter //
create procedure createNewTeacher(IN name_T varchar(50), IN address_T varchar(50),
                                  IN email_T varchar(50), IN phoneNumber_T varchar(50),
                                  IN dateOfBirth_T date, in urlImg varchar(8000))
begin
    insert into teacher(name, address, email, phoneNumber, dateOfBirth, Img)
        value (name_T, address_T, email_T, phoneNumber_T, dateOfBirth_T, urlImg);
end//
delimiter ;
drop procedure createNewTeacher;
alter table teacher
    modify column Img varchar(8000);
# edit teacher by id
delimiter //
create procedure editTeacherById(IN id int, IN name_T varchar(50), IN address_T varchar(50),
                                 IN email_T varchar(50), IN phoneNumber_T varchar(50), IN dateOfBirth_T varchar(50))
begin
    update teacher
    set name        = name_T,
        address= address_T,
        email       = email_T,
        phoneNumber = phoneNumber_T,
        dateOfBirth = dateOfBirth_T
    where id = teacherId;

end //
delimiter ;

# find teacher by name
delimiter //
create procedure findTeacherByName(IN name_T varchar(50))
begin
    select *
    from teacher
    where name like name_T;
end //
delimiter ;


# remove teacher by id
delimiter //
create procedure removeTeacherById(IN id int)
begin
    delete from teacher where teacherId = id;
end //
delimiter ;
>>>>>>> 9d0f5bcd4c97e4d15526482a0cc9952ade04c72d

alter table teacher
    alter Img set default 'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fwww.yan.vn%2Fdan-mang-du-trend-thiet-ke-avatar-du-kieu-day-mau-sac-tu-anh-mac-dinh-224509.html&psig=AOvVaw1rtTGpWzR79539jj1BhPcp&ust=1622948381307000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDQ0oDA__ACFQAAAAAdAAAAABAD';

alter table user
    add column phoneNumber varchar(100) unique;

use class_mng;

delimiter //
create procedure createUser(in N_userName varchar(50), N_password varchar(50), N_role varchar(50), N_email varchar(50),
                            N_phoneNumber varchar(50))
begin
    insert into user(userName, password, role, email, phoneNumber)
        value(N_userName,N_password,N_role,N_email,N_phoneNumber);
end //
delimiter ;