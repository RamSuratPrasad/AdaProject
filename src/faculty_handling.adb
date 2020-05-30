with faculty_handling;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

package body faculty_handling is
   package Faculty_Vect is new Ada.Containers.Vectors(Element_Type => faculty, Index_Type => Natural);
   use Faculty_Vect;   
   faculties_vect : Vector;
   
   procedure AddFaculty is
      fact: faculty;
   begin
      Put_Line("Creating new faculty...");
      Put_Line("Name:");
      Skip_Line;
      fact.Name := To_Unbounded_String(Get_Line);
      Put_Line("Emp Id:");
      fact.EmpId := Integer'Value(Get_Line);
      Put_Line("Department:");
      fact.Department := To_Unbounded_String(Get_Line);
      Put_Line("Age:");
      fact.Age := Integer'Value(Get_Line);
      Put_Line("Joining Date:");
      fact.JoiningDate := To_Unbounded_String(Get_Line);
      Put_Line("Gender:");
      fact.Gender := To_Unbounded_String(Get_Line);
      if CheckFaculty(fact) = True then
         Put_Line("This faculty already exists.");
      else
         faculties_vect.Append(fact);
      end if;     
   end AddFaculty;
   
   procedure FormattedDisplay (f : faculty) is
   begin
      --Put_Line("Name" & " " & "EmpId" & " " & "Department" & " " & "Age" & " " & "Joiningdate" & " " & "Gender");
      Put_Line(To_String(f.Name) & " " & Integer'Image(f.EmpId) & " " & To_String(f.Department) & " "
                        & Integer'Image(f.Age) & " " & To_String(f.JoiningDate) & " " & To_String(f.Gender));
   
   end FormattedDisplay;
   
   procedure DisplayFaculty(Department : Unbounded_String := To_Unbounded_String("")) is
      filterApply : Boolean := True;
   
   begin
      if Department = To_Unbounded_String("") then
         filterApply := False;
      end if;
      Put_Line("Name" & " " & "EmpId" & " " & "Department" & " " & "Age" & " " & "Joiningdate" & " " & "Gender");
      for fact of faculties_vect loop
         if filterApply = True then
            if fact.Department = Department then
               FormattedDisplay(fact);    
            end if;
         else
            FormattedDisplay(fact);
         end if;
         
      end loop;
   
   end DisplayFaculty;
   
   procedure TransferFaculty (EmpId : Integer; ToDept : Unbounded_String) is
      trasDone : Boolean := False;
   
   begin
      for fact of faculties_vect loop
         if fact.EmpId = EmpId then
            fact.Department := ToDept;
            trasDone := True;
         end if;
         exit when fact.EmpId = EmpId;    
      end loop;
      if trasDone = True then
         Put_Line("Transfer of the employee completed successfully.");
      else
         Put_Line("Employee don't exist.");
      end if;
   end TransferFaculty;
   
   function CheckFaculty (f : faculty) return Boolean is
      checkFlag : Boolean := False;
   
   begin
      for fact of faculties_vect loop
         if fact.EmpId = f.EmpId then
            checkFlag := True;
         end if;
         exit when fact.EmpId = f.EmpId;    
      end loop;
      return checkFlag;
   end CheckFaculty;
   
   procedure DeleteFaculty (EmpId : Integer) is
      flagFound : Boolean := False;
      C : Cursor;
      factToBeDeleted : faculty;
   
   begin
      for fact of faculties_vect loop
         if fact.EmpId = EmpId then
            flagFound := True;
            factToBeDeleted := fact;
         end if;
         exit when fact.EmpId = EmpId;    
      end loop;
      if flagFound = False then
         Put_Line("Faculty didn't found.");
      else
         C := faculties_vect.Find(factToBeDeleted);
         if C /= No_Element then
            faculties_vect.Delete(C);
            Put_Line("Faculty deleted successfully.");
         end if;
      end if;
   end DeleteFaculty;
   
end faculty_handling;
