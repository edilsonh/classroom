# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[:"#{student}"][assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  grade_hash.map{|k, v| v[assignment_num - 1]}
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  ar = grade_hash.map{|k, v| v[assignment_num - 1]}
  ar.sum / ar.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  grade_hash.transform_values{|v| v.sum/v.length}
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
    "A"
  elsif score >= 80 and score < 90
    "B"
  elsif score >= 70 and score < 80
    "C"
  elsif score >= 60 and score < 70
    "D"
  elsif score < 60
    "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  a = averages(grade_hash)
  a.transform_values{|f| letter_grade(f)}
end

# Return the average for the entire class.
def class_average(grade_hash)
  length = grade_hash.map {|k, v| v.length}.sum
  total = grade_hash.map{|k, v| v.sum}.sum
  total / length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  tops = averages(grade_hash).sort{|a, b| b[1]<=>a[1]}.take(number_of_students)
  tops.map{|k, v| k}.take(number_of_students)
end
