import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

const apiKey = "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";

class InquiryController extends GetxController {
  late RunnableSequence<Object, Object> chain;
  late ConversationBufferMemory memory;
  @override
  Future<void> onInit() async {
    final model = ChatOpenAI(
        apiKey: apiKey,
        defaultOptions: const ChatOpenAIOptions(maxTokens: 100));
    const stringOutputParser = StringOutputParser();
    memory = ConversationBufferMemory(returnMessages: true);

    final promptTemplate = ChatPromptTemplate.fromPromptMessages([
      SystemChatMessagePromptTemplate.fromTemplate(
          "당신은 '멍해?'라고 불리는 어플리케이션의 1대1 문의를 위한 챗봇입니다."
          "언제나 예의바르게 존댓말을 해야 합니다."
          "2문장 이내로 대답하세요. 최대한 간결한 대답을 원합니다."
          "문장과 문장 사이에는 꼭 \n을 넣어주세요."
          "리뷰와 댓글에는 악용을 막기 위해 수정 기능이 없습니다. 삭제 기능만이 존재합니다."
          "회원 탈퇴는 마이페이지에서 할 수 있습니다. 마이페이지는 홈화면의 배너에서 접근가능합니다."
          "에러 관련 질문은 '아래 버튼을 눌러 개발자 메일로 문의하세요'라고 안내해주세요. 이때 꼭 '개발자 메일'이라는 단어를 넣어 안내해주세요."
          "이 외의 질문들은 '아래 버튼을 눌러 개발자 메일로 문의하세요'라고 안내해주세요. 이때 꼭 '개발자 메일'이라는 단어를 넣어 안내해주세요."
          "'기본 메일 앱을 사용할 수 없다'는 에러의 질문에는 개발자의 메일을 직접 알려주세요. 개발자 메일의 주소는 whrmawnrmawn@gmail.com 입니다."),
      const MessagesPlaceholder(variableName: 'history'),
      HumanChatMessagePromptTemplate.fromTemplate('{input}'),
    ]);

    chain = Runnable.fromMap({
          'input': Runnable.passthrough(),
          'history': Runnable.fromFunction(
            (final _, final __) async {
              final m = await memory.loadMemoryVariables();
              return m['history'];
            },
          ),
        }) |
        promptTemplate |
        model |
        stringOutputParser;
    super.onInit();
  }

  var dialog = [].obs;
  var textController = TextEditingController();
  var scrollController = ScrollController();

  void setScrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }

  Future<void> generateAnswer() async {
    var question = textController.text;
    textController.clear();
    dialog.add({
      "isAnswer": false,
      "text": question,
      "needMail": question.contains('개발자 메일')
    });
    setScrollDown();
    final answer = await chain.invoke(question);
    dialog.add({
      "isAnswer": true,
      "text": answer,
      "needMail": answer.toString().contains('개발자 메일')
    });
    setScrollDown();
    await memory.saveContext(
      inputValues: {'input': question},
      outputValues: {'output': answer},
    );
  }

  void sendEmail() async {
    final Email email = Email(
      body: '',
      subject: "['멍해?' 문의]",
      recipients: ['whrmawnrmawn@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      print(error);
      SnackBarWidget.show(SnackBarType.error, "기본 메일 앱을 사용할 수 없어요");
    }
  }
}
