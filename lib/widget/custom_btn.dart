import 'package:flutter/material.dart';

class ButtonsStyle extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback?  voidCallBack;



  const ButtonsStyle({super.key,
    required this.btnName,
    this.icon,
    this.bgColor=Colors.blue,
    this.textStyle,
    this.voidCallBack

  }
);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(5),
      width: 200,
      height: 170,
      decoration:BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color:bgColor,
       ),
        child: icon!=null ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon!,
            const SizedBox(height: 15,),
            Text(btnName,style: textStyle,)

          ],
        )
            : Center(
            child: Text(btnName,style: textStyle,),
        ),
    );
  }
}


///creating  custom btn for height and last two btn

class CustomBtn extends StatefulWidget {
       final String btnTxt;
       final TextStyle? textStyle;


       const CustomBtn({super.key,
         required this.btnTxt,
         this.textStyle,
       });


    @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: const Column(
          children: <Widget>[

          ],
        ),
    );
  }
}
