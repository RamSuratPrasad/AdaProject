with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body student_handling is
   headNodePtr : node_ptr := null;
   
   procedure FormattedDisplay (stu : student) is
   begin
      -- Anyway to declare it static so that it could execute only once
      --Put_Line("Name" & " " & "RollNum" & " " & "Department" & " " & "PursueYear" & " " & "DOB" & " " & "Age" & " " & "Gender");
      Put_Line(To_String(stu.Name) & " " & Integer'Image(stu.RollNumber) & 
                       " " & To_String(stu.Department) & " " & Integer'Image(stu.PursuYear) &
                       " " & To_String(stu.DOB) & Integer'Image(stu.Age) &
                       " " & To_String(stu.Gender));
   end FormattedDisplay;
   procedure SearchByDepartmentAndPursueYear(Dept : Unbounded_String; PursueYear : Integer) is
   TmpNodePtr : node_ptr := headNodePtr;
      
   begin
      if TmpNodePtr = null then
         Put_Line("No Student exists.");
   
      end if;
      Put_Line("Name" & " " & "RollNum" & " " & "Department" & " " & "PursueYear" & " " & "DOB" & " " & "Age" & " " & "Gender");
      while TmpNodePtr /= null loop
         if TmpNodePtr.all.Value.Department = Dept and TmpNodePtr.all.Value.PursuYear = PursueYear then
            FormattedDisplay(TmpNodePtr.all.Value);
            
         end if;
         
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
   
   end SearchByDepartmentAndPursueYear;
   procedure SearchByDepartment (Dept : Unbounded_String) is
      TmpNodePtr : node_ptr := headNodePtr;
      
   begin
      Put_Line("Name" & " " & "RollNum" & " " & "Department" & " " & "PursueYear" & " " & "DOB" & " " & "Age" & " " & "Gender");
      if TmpNodePtr = null then
         Put_Line("No Student exists.");
   
      end if;
      while TmpNodePtr /= null loop
         if TmpNodePtr.all.Value.Department = Dept then
            FormattedDisplay(TmpNodePtr.all.Value);
            
         end if;
         
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
      
   end SearchByDepartment;
   
   procedure SearchByRollNum (RollNum : Integer) is
      TmpNodePtr : node_ptr := headNodePtr;
      StudentFound : Boolean := False;
   begin
      Put_Line("Name" & " " & "RollNum" & " " & "Department" & " " & "PursueYear" & " " & "DOB" & " " & "Age" & " " & "Gender");
      if TmpNodePtr = null then
         Put_Line("No Student exists.");
   
      end if;
      while TmpNodePtr /= null loop
         if TmpNodePtr.all.Value.RollNumber = RollNum then
            FormattedDisplay(TmpNodePtr.all.Value);
            StudentFound := True;
         end if;
         exit when StudentFound = True;
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
   end SearchByRollNum;
   
   procedure DeleteStudent (RollNum : Integer) is
      StudentFound : Boolean := False;
      TmpNodePtr : node_ptr := headNodePtr;
      PreNodePtr : node_ptr := TmpNodePtr;
      
      begin
      while TmpNodePtr /= null loop
         if TmpNodePtr.all.Value.RollNumber = RollNum then
            if PreNodePtr = TmpNodePtr then -- head node matches
               TmpNodePtr := TmpNodePtr.all.Next;
               headNodePtr := TmpNodePtr; -- modified the headnodeptr
            else
               PreNodePtr.all.Next := TmpNodePtr.all.Next;
            end if;
            StudentFound := True;
            exit when StudentFound = True; -- Student found and deleted
         end if;
         
         PreNodePtr := TmpNodePtr;
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
      if StudentFound = True then
         Put_Line("Student deleted Successfully.");
      else
         Put_Line("Student is not found");
      end if;
      
   end DeleteStudent;
   
   procedure DisplayAllStudents is
      TmpNodePtr : node_ptr := headNodePtr;
   begin
      Put_Line("Name" & " " & "RollNum" & " " & "Department" & " " & "PursueYear" & " " & "DOB" & " " & "Age" & " " & "Gender");
      if TmpNodePtr = null then
         Put_Line("No Student exists.");
   
      end if;
      while TmpNodePtr /= null loop
         FormattedDisplay(TmpNodePtr.all.Value);
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
   end DisplayAllStudents;
   
   procedure CreatStudent is
      New_Student : student;
   
   begin
      Put_Line("Creating new student...");
      Put_Line("Name:");
      Skip_Line;
      New_Student.Name := To_Unbounded_String(Get_Line);
      Put_Line("RollNumber:");
      New_Student.RollNumber := Integer'Value(Get_Line);
      Put_Line("Age <<15 - 25>>:");
      New_Student.Age := Integer'Value(Get_Line);
      Put_Line("Date of Birth:");
      New_Student.DOB := To_Unbounded_String(Get_Line);
      Put_Line("Department:");
      New_Student.Department := To_Unbounded_String(Get_Line);
      Put_Line("Admission date:");
      New_Student.AdmDate := To_Unbounded_String(Get_Line);
      Put_Line("Gender:");
      New_Student.Gender := To_Unbounded_String(Get_Line);
      Put_Line("Pursuing Year <<1 .. 4>>");
      New_Student.PursuYear := Integer'Value(Get_Line);
      
      if CheckStudent(New_Student.RollNumber) then
         Put_Line("This Student already exists.");
      else
         InsertStudent(New_Student);
         
      end if;
      
   end CreatStudent;
   
   procedure InsertStudent (stu : student) is
       NewNodePtr : node_ptr := null;
       TmpNodePtr : node_ptr := headNodePtr;
      
   begin
      NewNodePtr := new node;
      NewNodePtr.all.Value := stu;
      if headNodePtr = null then
         NewNodePtr.all.Next := null;
      else
         NewNodePtr.all.Next := TmpNodePtr;
      end if;
         headNodePtr := NewNodePtr;
      
   end InsertStudent;
   
   function CheckStudent (RollNum : Integer) return Boolean is
      StudentFound : Boolean := False;
      TmpNodePtr : node_ptr := headNodePtr;  
      
      begin
      while TmpNodePtr /= null loop
         if TmpNodePtr.all.Value.RollNumber = RollNum then
            StudentFound := True;
            exit when StudentFound = True; -- Student found and no need to continue more
         end if;
         
         TmpNodePtr := TmpNodePtr.all.Next;
      end loop;
      return StudentFound;
   end CheckStudent;
   
   function GetListOf_Students return node_ptr is
   begin
      return headNodePtr;
   end GetListOf_Students;
   
end student_handling;
