import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnackSVG extends StatelessWidget {
  const SnackSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="34" height="46" viewBox="0 0 34 46" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M33.97 22.5199C33.97 32.1299 32.36 39.9299 30.37 39.9299C30.33 39.9299 30.3 39.9299 30.27 39.9099C30.21 39.9099 30.14 39.9299 30.08 39.9299H3.95C3.88 39.9299 3.81 39.9299 3.74 39.9099C3.7 39.9099 3.64 39.9299 3.6 39.9299C1.62 39.9299 0 32.1299 0 22.5199C0 12.9099 1.61 5.10986 3.6 5.10986C3.64 5.10986 3.7 5.10986 3.74 5.12986C3.81 5.12986 3.88 5.10986 3.95 5.10986H30.08C30.14 5.10986 30.21 5.10986 30.27 5.12986C30.31 5.10986 30.34 5.10986 30.37 5.10986C32.35 5.10986 33.97 12.8999 33.97 22.5199Z" fill="#727171"/>
          <path d="M31.2 45.0402H3.21C2.79 45.0402 2.5 44.6302 2.62 44.2402L3.3 42.1502C3.38 41.9002 3.62 41.7202 3.89 41.7202H30.54C30.81 41.7202 31.04 41.8902 31.13 42.1502L31.8 44.2402C31.93 44.6402 31.63 45.0402 31.21 45.0402H31.2Z" fill="#727171"/>
          <path d="M8.69002 21.97C7.54002 20.97 7.43002 19.22 8.43002 18.08C8.92002 17.52 9.59002 17.2 10.27 17.15C10.23 16.46 10.45 15.76 10.94 15.2C11.94 14.05 13.69 13.94 14.83 14.94C15.75 15.75 16.01 17.04 15.55 18.1C15.23 19.35 16.14 20.1 16.14 20.1L16.17 20.15L20.43 23.87H20.46C20.46 23.87 21.22 24.57 22.29 24.28C23.3 23.54 24.73 23.58 25.72 24.44C26.87 25.44 26.98 27.19 25.98 28.33C25.49 28.89 24.82 29.21 24.14 29.26C24.18 29.95 23.95 30.65 23.46 31.21C22.46 32.36 20.71 32.48 19.57 31.47C18.6 30.63 18.37 29.26 18.92 28.17C19.08 27.05 18.28 26.38 18.28 26.38L18.26 26.36L13.96 22.6C13.88 22.53 12.97 21.77 11.78 22.34C11.74 22.35 11.7 22.38 11.66 22.4C10.71 22.84 9.54002 22.7 8.70002 21.97H8.69002Z" fill="#DCDDDD"/>
          <path d="M2.98997 0H30.99C31.41 0 31.7 0.41 31.58 0.8L30.9 2.89C30.82 3.14 30.58 3.32 30.31 3.32H3.65997C3.38997 3.32 3.15997 3.15 3.06997 2.89L2.39997 0.8C2.26997 0.4 2.56997 0 2.98997 0Z" fill="#727171"/>
          </svg>
          ''',
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}