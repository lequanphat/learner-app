import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/auth/custom_auth/auth_util.dart';

double? calculateSessionProgress(List<dynamic>? sessionLearnerMaterials) {
  if (sessionLearnerMaterials == null || sessionLearnerMaterials.isEmpty) {
    return 1.0;
  }

  int passedCount =
      sessionLearnerMaterials.where((item) => item["is_passed"] == true).length;
  double progress = passedCount / sessionLearnerMaterials.length;

  return progress;
}

String? getSessionProgressPercentage(List<dynamic>? sessionLearnerMaterials) {
  if (sessionLearnerMaterials == null || sessionLearnerMaterials.isEmpty) {
    return "100%";
  }

  int passedCount =
      sessionLearnerMaterials.where((item) => item["is_passed"] == true).length;
  double progress = (passedCount / sessionLearnerMaterials.length) * 100;

  return "${progress.toStringAsFixed(0)}%";
}

Color? getSessionStatusColor(
  bool? isCompleted,
  bool? isProgress,
  bool? isAvailable,
) {
  if (isAvailable == false) {
    return Color(0xFFD6D6D6);
  }

  if (isCompleted == true) {
    return Color(0xFF5DD57B);
  }

  if (isProgress == true) {
    return Color(0xFF3FC0F3);
  }

  return Color(0xFFFFD633);
}

double? getAttendPercent(
  int? enrolledClasses,
  int? attendedClasses,
) {
  if (enrolledClasses == null ||
      attendedClasses == null ||
      enrolledClasses == 0) {
    return null;
  }

  double percent = (attendedClasses / enrolledClasses);
  return double.parse(percent.toStringAsFixed(1));
}

String? getMaterialIconByType(String? materialType) {
  switch (materialType) {
    case "PDF":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/vclrlen0nxnq/vscode-icons--file-type-pdf2.png";
    case "DOCS":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/tk0cn9yoj1w9/vscode-icons--file-type-word2.png";
    case "EXCEL":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/1jgt95uko6sk/vscode-icons--file-type-excel2.png";
    case "INTERACTIVE":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/1jtzf8l5650e/vscode-icons--file-type-zip.png";
    case "YOUTUBE":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/ve0i534co82e/logos--youtube-icon.png";
    case "QUIZ":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/6h27bcbns7kl/material-symbols--quiz-outline-rounded.png";
    case "EXTERNAL_CONTENT":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/gbnjsnxsc5l7/vscode-icons--file-type-htmlhint.png";
    case "ASSIGNMENT":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/mmvnd5sonvri/mdi--assignment-ind-outline.png";
    case "KEYNOTE":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/ytdh68erghka/material-symbols-light--note-outline-rounded.png";
    case "POWERPOINT":
      return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/edz40wdbfc31/vscode-icons--file-type-powerpoint2.png";
    default:
      return "assets/icons/default_icon.png";
  }
}

double? getPassPercent(
  int? enrolledClasses,
  int? passedClasses,
) {
  if (enrolledClasses == null ||
      passedClasses == null ||
      enrolledClasses == 0) {
    return null; // Return null if input is invalid
  }

  double percent = (passedClasses / enrolledClasses);
  return double.parse(percent.toStringAsFixed(1)); // Keep 1 decimal place
}

String? formatDate(String? date) {
  if (date == null) return null;
  try {
    DateTime parsedDate =
        DateTime.parse(date).toLocal(); // Convert to local time
    return DateFormat('HH:mm dd/MM/yyyy').format(parsedDate);
  } catch (e) {
    return null; // Handle invalid date format gracefully
  }
}

int? getTimeOfQuiz(
  int? timeLimit,
  String? from,
  String? to,
) {
  if (timeLimit != null && timeLimit > 0) {
    return timeLimit * 60 * 1000; // Convert minutes to milliseconds
  }

  if (to != null) {
    try {
      DateTime now = DateTime.now();
      DateTime toDate = DateTime.parse(to).toLocal();
      return toDate.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
    } catch (e) {
      return null; // Handle invalid date format
    }
  }

  return null; // Return null if neither timeLimit nor to exists
}

bool? canDoQuiz(
  String? from,
  String? to,
  int? limitRetry,
  int? attempts,
) {
  if (from == null || limitRetry == null || attempts == null) return null;

  try {
    DateTime now = DateTime.now();
    DateTime fromDate = DateTime.parse(from).toLocal();
    DateTime? toDate = to != null ? DateTime.parse(to).toLocal() : null;

    if (now.isAfter(fromDate) && (toDate == null || now.isBefore(toDate))) {
      return attempts < limitRetry;
    }

    return false;
  } catch (e) {
    return null; // Handle invalid date format gracefully
  }
}

List<dynamic>? initInternalQuizAnswers(List<dynamic>? questions) {
  if (questions == null) return null;

  return questions.map((question) {
    List<dynamic> answerOptions = question['internal_quiz_question_options']
        .map((option) => {
              "internal_quiz_question_option": option['id'],
              "is_checked": false,
              "is_answer_key": option['is_answer_key'],
              "answer_text": "",
              "answer_paragraph": "",
              "score": option['default_score'] ?? 0,
              "label": option['label'],
            })
        .toList();

    return {
      "answer_type": question['answer_type'],
      "internal_quiz_question": question['id'],
      "internal_quiz_answer_options": answerOptions,
      "default_point": question['default_point'],
      "score": 0,
    };
  }).toList();
}

List<dynamic>? checkboxChange(
  List<dynamic>? old,
  bool? checked,
  int? questionId,
  int? optionId,
) {
  if (old == null) return null;

  return old.map((question) {
    if (question['internal_quiz_question'] == questionId) {
      question['internal_quiz_answer_options'] =
          (question['internal_quiz_answer_options'] as List).map((option) {
        if (option['internal_quiz_question_option'] == optionId) {
          option['is_checked'] = checked;
        }
        return option;
      }).toList();
    }
    return question;
  }).toList();
}

bool? isChecked(
  List<dynamic>? internalQuizAnswers,
  int? questionId,
  int? optionId,
) {
  if (internalQuizAnswers == null || questionId == null || optionId == null) {
    return false;
  }

  for (var answer in internalQuizAnswers) {
    if (answer['internal_quiz_question'] == questionId) {
      for (var option in answer['internal_quiz_answer_options']) {
        if (option['internal_quiz_question_option'] == optionId) {
          return option['is_checked'] as bool?;
        }
      }
    }
  }

  return false;
}

int? getTotalScore(List<dynamic>? answers) {
  if (answers == null) return 0;

  int totalScore = 0;

  for (var answer in answers) {
    int totalQuestionScore = 0;
    switch (answer['answer_type']) {
      case 'CHECKBOXES':
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_checked'] == true) {
            totalQuestionScore += (option['score'] as num).toInt();
          }
        }
      case 'CHECKBOXES_BY_RESULT':
        totalQuestionScore = (answer['default_point'] as num).toInt();
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_checked'] != option['is_answer_key']) {
            totalQuestionScore = 0;
            break;
          }
        }

      case 'MULTIPLE_CHOICE':
      case 'DROPDOWN':
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_answer_key'] == true && option['is_checked'] == true) {
            totalQuestionScore += (option['score'] as num).toInt();
          }
        }
    }

    totalScore += totalQuestionScore;
  }

  return totalScore;
}

Color? getRadioButtonColor(bool? isChecked) {
  if (isChecked == true) {
    // Thêm '0xFF' vào trước mã màu hex
    return const Color(0xFF009DC8);
  }
  return const Color(0xFFA6ADBB);
}

List<dynamic>? radioChange(
  List<dynamic>? old,
  int? questionId,
  int? optionId,
  bool? checked,
) {
  if (old == null) return null;

  return old.map((question) {
    if (question['internal_quiz_question'] == questionId) {
      question['internal_quiz_answer_options'] =
          (question['internal_quiz_answer_options'] as List).map((option) {
        if (option['internal_quiz_question_option'] == optionId) {
          option['is_checked'] = checked;
        } else {
          option['is_checked'] = false;
        }
        return option;
      }).toList();
    }
    return question;
  }).toList();
}

String? getParagraphAnswer(
  List<dynamic>? answers,
  int? questionId,
) {
  if (answers == null || questionId == null) {
    return "";
  }

  for (var answer in answers) {
    if (answer['internal_quiz_question'] == questionId) {
      for (var option in answer['internal_quiz_answer_options']) {
        return option['answer_paragraph'];
      }
    }
  }

  return ""; // Trả về chuỗi rỗng nếu không tìm thấy câu trả lời
}

List<dynamic>? dropdownChange(
  List<dynamic>? old,
  String? selectedText,
  int? questionId,
) {
  if (old == null) return null;

  return old.map((question) {
    if (question['internal_quiz_question'] == questionId) {
      question['internal_quiz_answer_options'] =
          (question['internal_quiz_answer_options'] as List).map((option) {
        if (option['label'] == selectedText) {
          option['is_checked'] = true;
        } else {
          option['is_checked'] = false;
        }
        return option;
      }).toList();
    }
    return question;
  }).toList();
}

String? getSelectedDropdownItem(
  List<dynamic>? internalQuizAnswers,
  int? questionId,
) {
  if (internalQuizAnswers == null || questionId == null) {
    return null;
  }

  for (var answer in internalQuizAnswers) {
    if (answer['internal_quiz_question'] == questionId) {
      for (var option in answer['internal_quiz_answer_options']) {
        if (option['is_checked'] == true) {
          return option['label'];
        }
      }
    }
  }

  return null;
}

List<dynamic>? shortAnswerChange(
  List<dynamic>? old,
  int? questionId,
  String? text,
) {
  if (old == null) return null;

  return old.map((question) {
    if (question['internal_quiz_question'] == questionId) {
      question['internal_quiz_answer_options'] =
          (question['internal_quiz_answer_options'] as List).map((option) {
        option['answer_text'] = text;
        return option;
      }).toList();
    }
    return question;
  }).toList();
}

List<dynamic>? paragraphChange(
  List<dynamic>? old,
  int? questionId,
  String? text,
) {
  if (old == null) return null;

  return old.map((question) {
    if (question['internal_quiz_question'] == questionId) {
      question['internal_quiz_answer_options'] =
          (question['internal_quiz_answer_options'] as List).map((option) {
        option['answer_paragraph'] = text;
        return option;
      }).toList();
    }
    return question;
  }).toList();
}

List<dynamic>? calculateScoreForEachQuestion(List<dynamic>? old) {
  if (old == null) return null;

  return old.map((answer) {
    int totalQuestionScore = 0;

    switch (answer['answer_type']) {
      case 'CHECKBOXES':
        // Cộng dồn score cho mỗi option được check
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_checked'] == true) {
            totalQuestionScore += (option['score'] as num).toInt();
          }
        }
        break; // <--- THÊM break

      case 'CHECKBOXES_BY_RESULT':
        // Mặc định bằng default_point
        totalQuestionScore = (answer['default_point'] as num).toInt();

        // Nếu bất kỳ option check sai với answer_key => score = 0
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_checked'] != option['is_answer_key']) {
            totalQuestionScore = 0;
            break;
          }
        }
        break; // <--- THÊM break

      case 'MULTIPLE_CHOICE':
      case 'DROPDOWN':
        // Chỉ cộng score cho option có is_answer_key = true và is_checked = true
        for (var option in answer['internal_quiz_answer_options']) {
          if (option['is_answer_key'] == true && option['is_checked'] == true) {
            totalQuestionScore += (option['score'] as num).toInt();
          }
        }
        break; // <--- THÊM break

      default:
        // Nếu muốn xử lý mặc định
        break;
    }

    // Gán tổng score cho question
    answer['score'] = totalQuestionScore;

    return answer;
  }).toList(); // <--- THÊM .toList()
}

String? getAttempsOnLimitRetry(
  int? limitRetry,
  int? attemps,
) {
  if (limitRetry == null || attemps == null) return null;

  return '$attemps/$limitRetry';
}

String? getShortAnswer(
  List<dynamic>? answers,
  int? questionId,
) {
  if (answers == null || questionId == null) {
    return "";
  }

  for (var answer in answers) {
    if (answer['internal_quiz_question'] == questionId) {
      for (var option in answer['internal_quiz_answer_options']) {
        return option['answer_text'];
      }
    }
  }

  return ""; // Trả về chuỗi rỗng nếu không tìm thấy câu trả lời
}

int? getListViewPage(int? page) {
  if (page == null) return 1;

  return page + 1;
}

String? getCurrentISOdate() {
  return DateTime.now().toUtc().toIso8601String();
}
