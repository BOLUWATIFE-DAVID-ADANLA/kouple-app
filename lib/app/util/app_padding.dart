import 'package:flutter/material.dart';
import 'package:kouple_app/app/util/sizeconfig.dart';

class SymetricPadding extends StatelessWidget {
  final double h;
  final double v;
  final Widget child;
  const SymetricPadding(
      {super.key, required this.h, required this.v, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fromDesignHeight(context, h),
          vertical: SizeConfig.fromDesignWidth(context, v)),
      child: child,
    );
  }
}

class CustomPadding extends StatelessWidget {
  final double pad;
  final Widget child;

  const CustomPadding({super.key, required this.pad, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, pad)),
      child: child,
    );
  }
}

class CustomPaddingTop extends StatelessWidget {
  final double pad;
  final Widget child;

  const CustomPaddingTop({super.key, required this.pad, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.fromDesignHeight(context, pad)),
      child: child,
    );
  }
}

class CustomPaddingBottom extends StatelessWidget {
  final double pad;
  final Widget child;

  const CustomPaddingBottom(
      {super.key, required this.pad, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: SizeConfig.fromDesignHeight(context, pad)),
      child: child,
    );
  }
}

class CustomPaddingLeft extends StatelessWidget {
  final double pad;
  final Widget child;

  const CustomPaddingLeft({super.key, required this.pad, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.fromDesignWidth(
        context,
        pad,
      )),
      child: child,
    );
  }
}

class CustomPaddingRight extends StatelessWidget {
  final double pad;
  final Widget child;

  const CustomPaddingRight({super.key, required this.pad, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.fromDesignWidth(
          context,
          pad,
        ),
      ),
      child: child,
    );
  }
}

class CustomPaddingTBRL extends StatelessWidget {
  final double r, l, b, t;
  final Widget child;

  const CustomPaddingTBRL(
      {super.key,
      required this.r,
      required this.b,
      required this.l,
      required this.t,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.fromDesignWidth(
          context,
          r,
        ),
        left: SizeConfig.fromDesignWidth(
          context,
          l,
        ),
        top: SizeConfig.fromDesignWidth(
          context,
          t,
        ),
        bottom: SizeConfig.fromDesignWidth(
          context,
          b,
        ),
      ),
      child: child,
    );
  }
}
