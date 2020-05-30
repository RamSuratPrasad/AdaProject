with student_handling;
use student_handling;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Sequential_IO;

package body department_handling is
   --package Student is new student_handling;
   student1 : student;--_handling.student := ( To_Unbounded_String("ShauryaAnsh Raunak"), 1147, To_Unbounded_String("28-07-2012"), 20, To_Unbounded_String("10-April-2015"), To_Unbounded_String("Male"), 1 ); -- hard coded
   student2 : student;--_handling.student := ( To_Unbounded_String("Naisa Maurya"), 1148, To_Unbounded_String("28-07-2011"), 21, To_Unbounded_String("10-April-2015"), To_Unbounded_String("Female"), 1 ); -- hard coded
   --student3 : student_handling.student;
   name: Unbounded_String;
   student_file : String := "student_file.bin";
   --faculty_file : string := "faculty_file.bin";  
   package Student_Info_IO is new Ada.Sequential_IO (student);
   use Student_Info_IO;
   F_Student : Student_Info_IO.File_Type;
   --subtype student is student_handling.student;
   procedure AddStudent is
      --type index is range 1 .. 2; -- temporary to create multiple students
      --type student_Array is array(index) of student_handling.student;
      --stuArr : student_Array := (student1, student2);
      --stu : student_handling.student;
      --student1 : student_handling.student := ( To_Unbounded_String("ShauryaAnsh Raunak"), 1147, To_Unbounded_String("28-07-2012"), 20, To_Unbounded_String("10-April-2015"), To_Unbounded_String("Male"), 1 ); -- hard coded
      --student2 : student_handling.student := ( To_Unbounded_String("Naisa Maurya"), 1148, To_Unbounded_String("28-07-2011"), 21, To_Unbounded_String("10-April-2015"), To_Unbounded_String("Female"), 1 ); -- hard coded   
   begin
      -- Prompt user to input new user data
      --for i in index loop
      --stuArr(i) := student_handling.CreatStudent;
      -- GetStudent(student) returns boolean to check whether student already
      -- present in list, if true, prompt user and ignore if not write it to file
      -- and add to list
      --for i in index loop
      student1 := student_handling.CreatStudent;
      --student_handling.DisplayStudent(student1);
      Write(F_Student, student1);
      student2 := student_handling.CreatStudent;
      Write(F_Student, student2);
      --student3 := student_handling.CreatStudent;
      --Write(F_Student, student3);
      --student_handling.DisplayStudent(stuArr(i));
      --end loop;   
       -- AddToList(student)
       --null;
   end AddStudent;
   procedure InitialSetup is
   begin
      -- Open if already exist otherwise create
      Create (F_Student, Out_File, student_file);
      --Read each record from the file and store it in Students Set, key is the
      -- RollNumber
      -- call student AddToList(student); 
      --Close(F_Student);
   end InitialSetup;
   procedure ExitSetup is
   begin
      Close(F_Student);
   end ExitSetup;
   procedure Display is
   begin
    Close(F_Student);  
    Open (F_Student, In_File, student_file);  
    while not End_Of_File (F_Student) loop
         Read (F_Student, student);
           Put_Line("Found");
         --Put_Line(To_String(student.Name) & Integer'Image(student.RollNumber) & To_String(student.DOB) & Integer'Image(student.Age) & To_String(student.AdmDate) & To_String(student.Gender) & Integer'Image(student.PursuYear) );
           student_handling.DisplayStudent (student);
     end loop;
   end Display;
end department_handling;
