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
    _faqs = [
      FaqItem(
        question: "What is a blockchain-based voting app?",
        answer:
            "A blockchain-based voting app uses blockchain technology to ensure secure, transparent, and tamper-proof voting processes. Each vote is recorded as a transaction on the blockchain, making it immutable and verifiable.",
      ),
      FaqItem(
        question: "How does blockchain improve voting security?",
        answer:
            "Blockchain technology enhances voting security by ensuring that each vote is encrypted and stored on a decentralized network. This prevents tampering and fraud, as the data is immutable and any changes would be evident to all participants.",
      ),
      FaqItem(
        question: "How does SUI enhance the security of voting apps?",
        answer:
            "SUI provides enhanced security through its decentralized architecture, where data is distributed across multiple nodes. This makes it extremely difficult for any single entity to alter or tamper with the voting records, ensuring the integrity of the voting process.",
      ),
      FaqItem(
        question: "Can SUI-based voting apps ensure voter anonymity?",
        answer:
            "Yes, SUI-based voting apps can ensure voter anonymity by using cryptographic techniques. Voters' identities are kept confidential, and their votes are recorded without revealing personal information, ensuring privacy and anonymity.",
      ),
      FaqItem(
        question: "What are the benefits of using a SUI-based voting app?",
        answer:
            "SUI-based voting apps offer several benefits, including enhanced security, transparency, and trust. The use of blockchain ensures that votes are immutable and verifiable, reducing the risk of fraud and manipulation. Additionally, the decentralized nature of SUI provides resilience against attacks and system failures.",
      ),
    ];
  }
}
