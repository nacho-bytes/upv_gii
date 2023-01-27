# -*- coding: utf-8 -*-

def write_sudoku(matrix):
  for i in range(9):
    print("".join(str(matrix[i][j]+1)+("|" if j in [2,5] else "") for j in range(9)))
    if i in [2,5]: print("---+---+---")
  print()

def sudoku(matrix): # matrix is a 9x9 matrix with values between 0 and
                    # 8 and where -1 denote empty positions
  reserve_row = [[False]*9 for i in range(9)] # digit row
  reserve_col = [[False]*9 for i in range(9)] # digit col
  reserve_box = [[[False]*3 for i in range(3)] for j in range(9)] # digit box_row box_col

  def check_sudoku():
    for r in range(9):
      for c in range(9):
        digit = matrix[r][c];
        if digit != -1:
          if reserve_row[digit][r] or \
             reserve_col[digit][c] or \
             reserve_box[digit][r//3][c//3]:
            return False
          reserve_row[digit][r]        = True
          reserve_col[digit][c]        = True
          reserve_box[digit][r//3][c//3] = True
    return True

  def backtracking(pos):
    if pos == 81:
      print("Solucion:")
      write_sudoku(matrix)
    else:
      r = pos//9
      c = pos%9
      saved_digit = matrix[r][c]
      if saved_digit != -1: # nos lo saltamos
        backtracking(pos+1)
      else:
        # ramificar probando digitos en matrix[r][c]
        for digit in range(9):
          if not reserve_row[digit][r] and \
             not reserve_col[digit][c] and \
             not reserve_box[digit][r//3][c//3]:
            # reservar:
            matrix[r][c]                 = digit
            reserve_row[digit][r]        = True
            reserve_col[digit][c]        = True
            reserve_box[digit][r//3][c//3] = True
            # llamada recursiva
            backtracking(pos+1);
            # restaurar:
            reserve_row[digit][r]        = False
            reserve_col[digit][c]        = False
            reserve_box[digit][r//3][c//3] = False
        matrix[r][c] = saved_digit
  if not check_sudoku():
    print("Este sudoku no se puede resolver")
  else:
    backtracking(0)

def read_matrix(matrixString):
  matrix = []
  for line in matrixString.split():
    matrix.append([int(c)-1 for c in line])
  return matrix

sudoku_string = """
800600501
607003020
050020000
000180030
006905100
040062000
000090060
060400205
405000000
"""

if __name__ == "__main__":
  matrix = read_matrix(sudoku_string)
  print("Datos de entrada:")
  write_sudoku(matrix)
  sudoku(matrix)

