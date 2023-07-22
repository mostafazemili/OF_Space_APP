import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/models/faq.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {

  List<Faq> _faqs =<Faq>[
    Faq(question: 'Question #1', answer: 'Answer #1'),
    Faq(question: 'Question #2', answer: 'Answer #2'),
    Faq(question: 'Question #3', answer: 'Answer #3'),
    Faq(question: 'Question #4', answer: 'Answer #4'),
    Faq(question: 'Question #5', answer: 'Answer #5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs',style: GoogleFonts.aBeeZee(
            color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Color(0xFFF0DE36),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount:  _faqs.length,
        itemBuilder: (context , index ){
          return ExpansionTile(
            onExpansionChanged: (bool expanded){},
            leading: Icon(Icons.question_answer),
            collapsedBackgroundColor: Color(0xFFFBEEAC),
            tilePadding: EdgeInsets.all(10),
            childrenPadding: EdgeInsets.all(10),
              title: Text(_faqs[index].question),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            iconColor:  Color(0xFF000000),
            textColor: Colors.black87,
            children: [
              Text(_faqs[index].answer , textAlign: TextAlign.start ,),
            ],
          );
        },
      ),
    );
  }
}


// ListView(
// children: [
// ExpansionPanelList(
// elevation: 4,
// expandedHeaderPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10 ),
// dividerColor: Colors.pink.shade200,
// animationDuration: Duration(seconds: 1),
// expansionCallback: (int index , bool expanded ){
// print('Index: $index :: Expanded $expanded');
// _faqs.forEach((element) {
// element.expanded = false ;
// });
// setState(() => _faqs[index].expanded = !expanded) ;
// },
// children: _faqs.map((Faq faq) {
// return ExpansionPanel(
// isExpanded: faq.expanded,
// canTapOnHeader: true ,
// backgroundColor: Colors.blue.shade200,
// headerBuilder: (context , isExpanded ) {
// return Row(
// children: [
// Icon(Icons.question_answer),
// SizedBox(width: 5 ),
// Text('Question'),
// ],
// );
// },
// body: Container(
// color: Colors.white,
// width: double.infinity,
// padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10 ),
// child: Text(faq.answer)),
// );
// },
// ).toList(),
// ),
// ],
// ),
