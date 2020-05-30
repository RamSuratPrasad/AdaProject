with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Sequential_IO;

package student_handling is

   type Student_Class is tagged null record;
   type student is new Student_Class with record
         Name : Unbounded_String;
         RollNumber : Integer; --in range of Positive <>
         DOB : Unbounded_String;
         Age : Integer range 15 .. 25;
         Department : Unbounded_String;
         AdmDate : Unbounded_String;
         Gender : Unbounded_String;
         PursuYear : Integer range 1 .. 4;
   end record;
   type node;
   type node_ptr is access node;
   type node is record
      Value : student;
      Next : node_ptr := null;
   end record;
   procedure CreatStudent;
   procedure DisplayAllStudents;
   function CheckStudent (RollNum : Integer) return Boolean;
   procedure DeleteStudent(RollNum : Integer);
   procedure SearchByRollNum(RollNum : Integer);
   procedure SearchByDepartment(Dept : Unbounded_String);
   procedure SearchByDepartmentAndPursueYear(Dept : Unbounded_String; PursueYear : Integer);
   procedure InsertStudent(stu : student);
   function GetListOf_Students return node_ptr;
   procedure FormattedDisplay( stu : student);

end student_handling;
