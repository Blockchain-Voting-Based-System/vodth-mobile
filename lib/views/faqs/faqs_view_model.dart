import 'package:vodth_mobile/core/base/base_view_model.dart';

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class FaqsViewModel extends BaseViewModel {
  List<FaqItem> _faqs = [];

  List<FaqItem> get faqs => _faqs;

  FaqsViewModel() {
    _loadFaqs();
  }

  void _loadFaqs() {
    // setLoading(true);

    // Simulate a delay to mimic fetching data from an API or database
    Future.delayed(const Duration(seconds: 2), () {
      _faqs = [
        FaqItem(question: "Question 1?", answer: "Our return policy is..."),
        FaqItem(
            question: "Question 2?", answer: "You can track your order by..."),
        FaqItem(
            question: "Question 3?", answer: "Yes, we offer private voting..."),
      ];

      // setLoading(false);
      notifyListeners();
    });
  }
}
