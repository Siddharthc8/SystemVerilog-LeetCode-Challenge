`timescale 1ns / 1ps




module a4_392_Is_Subsequence();

  class solutions;
    // Method: Check if s is subsequence of t
    function bit isSubsequence(string s, string t);
      int i = 0, j = 0;
      
      while (i < s.len() && j < t.len()) begin
        if (s[i] == t[j]) begin
          i++;
        end
        j++;
      end
      
      return (i == s.len());
    endfunction
  endclass

  initial begin
    solutions solver = new();
    string test_cases[5][2] = '{
      {"abc", "ahbgdc"},   // Expected: 1 (true)
      {"axc", "ahbgdc"},   // Expected: 0 (false)
      {"", "ahbgdc"},      // Expected: 1 (true)
      {"b", "abc"},        // Expected: 1 (true)
      {"aaaa", "bbaaaa"}   // Expected: 1 (true)
    };

    $display("| Test Case   | Result |");
    $display("|-------------|--------|");

    foreach (test_cases[i]) begin
      bit result = solver.isSubsequence(test_cases[i][0], test_cases[i][1]);
      $display("| %s in %s | %d      |", 
               test_cases[i][0], test_cases[i][1], result);
    end

    #10 $finish;
  end

endmodule