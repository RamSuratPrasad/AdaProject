with student_handling;
with faculty_handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Sequential_IO;
--with IO_Exceptions;

procedure Main is
   mainOption : Integer := 0;
   studentOption : Integer;
   facultyOption : Integer;

   -- Read the files for Students and Faculties already created
   --StudentFile_Exist : Boolean := True;

   --package Student_IO is new Ada.Sequential_IO (Student_Class);
   --use Student_IO;

   --F_Student         : Student_IO.File_Type;
   --FileName_Student : constant String := "student_file.bin";
begin
   -- Unfortunately not able to open fails when file is not already created
   --Open(F_Student, In_File, FileName_Student);
--exception
   --when IO_Exceptions.Name_Error =>
   --   StudentFile_Exist := False;

   --   if StudentFile_Exist = True then
   --      declare
   --         Value : student_handling.student;
   --      begin
   --         while not End_Of_File(F_Student) loop
   --            Read(F_Student, Value);
   --            student_handling.InsertStudent(Value);
   --         end loop;
   --      end;
   --   end if;
   -- Similar file handling codes for faculty also;
      loop
      New_Line;
      Put_Line("Enter 1 => Student handling");
      Put_Line("Enter 2 => Faculty handling");
      Put_Line("Others number => Program termination");
      Put(">>");
      Get(mainOption);
      case mainOption is
         when 1 =>
            Put_Line("Enter 1 => Add Student");
            Put_Line("Enter 2 => Display all Students");
            Put_Line("Enter 3 => Delete Student");
            Put_Line("Enter 4 => Search Student");
            Put_Line("Other number => Main Menu");
            Put(">>");
            Get(studentOption);
            if studentOption = 1 then
               student_handling.CreatStudent;
            elsif studentOption = 2 then
               student_handling.DisplayAllStudents;
            elsif studentOption = 3 then
               declare
                  RollNum : Integer;
               begin
                  Put("Enter Student Roll Number to be deleted>>");
                  Get(RollNum);
                  student_handling.DeleteStudent(RollNum);
               end;
            elsif studentOption = 4 then

               declare
                  RollNum : Integer;
                  Dept : Unbounded_String;
                  PursueYear : Integer;
                  SearchOption: Integer;
               begin
                  Put_Line("Enter 1 => Search by Roll Number.");
                  Put_Line("Enter 2 => Seach by department.");
                  Put_Line("Enter 3 => Seach by department and Pursuing Year");
                  Put(">>");
                  Skip_Line;
                  Get(SearchOption);
                  case SearchOption is
                     when 1 =>
                        Put("Enter RollNum>>");
                        Get(RollNum);
                        student_handling.SearchByRollNum(RollNum);
                     when 2 =>
                        Put_Line("Enter Department>>");
                        Skip_Line;
                        Dept := To_Unbounded_String(Get_Line);
                        student_handling.SearchByDepartment(Dept);
                     when 3 =>
                        Put_Line("Enter Department>>");
                        Skip_Line;
                        Dept := To_Unbounded_String(Get_Line);
                        Put("Enter Pursuing Year>>");
                        Get(PursueYear);
                        student_handling.SearchByDepartmentAndPursueYear(Dept, PursueYear);
                     when others =>
                        exit;
                  end case;
               end;
            end if;
         when 2 =>
            Put_Line("Enter 1 => Add Faculty");
            Put_Line("Enter 2 => Delete Faculty");
            Put_Line("Enter 3 => Transfer Faculty");
            Put_Line("Enter 4 => Display Faculty");
            Put_Line("Other number => Main Menu");
            Put(">>");
            Get(facultyOption);
            if facultyOption = 1 then
               faculty_handling.AddFaculty;
            elsif facultyOption = 2 then
               declare
                  EmpId : Integer;
               begin
                  Put("Enter the EmpId of the Employee being deleted>>");
                  Get(EmpId);
                  faculty_handling.DeleteFaculty(EmpId);
               end;
            elsif facultyOption = 3 then
               declare
                  EmpId : Integer;
                  dept : Unbounded_String;
               begin
                  Put("Enter the EmpId of employee to be transferred>>");
                  Get(EmpId);
                  Put_Line("Enter the department to which transfer is initiated.");
                  Skip_Line;
                  dept := To_Unbounded_String(Get_Line);
                  faculty_handling.TransferFaculty(EmpId, dept);
               end;
            elsif facultyOption = 4 then
               declare
                  displayOption : Integer;
                  department : Unbounded_String;

               begin
                  Put_Line("Enter 1 => Display All Faculties.");
                  Put_Line("Enter 2 => Display Faculties department-wise");
                  Put(">>");
                  Skip_Line;
                  Get(displayOption);
                  if displayOption = 1 then
                     faculty_handling.DisplayFaculty;
                  elsif displayOption = 2 then
                     Put_Line("Enter department");
                     Skip_Line;
                     department := To_Unbounded_String(Get_Line);
                     faculty_handling.DisplayFaculty(department);
                  end if;
               end;
            end if;
         when others =>
            exit;
      end case;

   end loop;
      -- When Program Exiting write the created students and faculty to the file
      --if StudentFile_Exist = True then
      --   Open(F_Student, Out_File, FileName_Student);
      --else
      --   Create(F_Student, Out_File, FileName_Student);
      --end if;

      --declare
         --ListOfStudents : student_handling.node_ptr := student_handling.GetListOf_Students;
      --begin

      --   while student_handling.headNodePtr /= null loop
      --      Write(F_Student, student_handling.headNodePtr.all.Value);
      --      student_handling.headNodePtr := student_handling.headNodePtr.all.Next;
      --   end loop;
      --end;
     -- Similar file handling codes for faculty also;
end Main;
