import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodySVG extends StatelessWidget {
  const BodySVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="21" height="48" viewBox="0 0 21 48" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1885)">
          <path d="M14.57 2.32022C14.57 2.38022 14.57 2.43022 14.56 2.48022C14.56 2.50022 14.57 2.52022 14.57 2.54022V8.78022C14.57 8.78022 14.57 8.83022 14.55 8.85022C14.56 8.87022 14.57 8.89022 14.57 8.91022C14.57 9.31022 12.56 9.63022 10.07 9.63022C7.58001 9.63022 5.57001 9.31022 5.57001 8.91022C5.57001 8.89022 5.57001 8.87022 5.59001 8.85022C5.58001 8.83022 5.57001 8.80022 5.57001 8.78022V2.55022C5.57001 2.55022 5.57001 2.51022 5.59001 2.49022C5.59001 2.44022 5.58001 2.38022 5.58001 2.33022V0.990216C5.57001 0.370216 6.08001 -0.0897837 6.64001 0.0202163C7.46001 0.170216 8.69001 0.270216 10.07 0.270216C11.45 0.270216 12.67 0.170216 13.49 0.0202163C14.05 -0.0897837 14.56 0.380216 14.56 1.00022V2.33022L14.57 2.32022Z" fill="#727171"/>
          <path d="M20.14 19.8198C20.14 20.0398 20.14 20.2498 20.11 20.4498C20.13 20.5198 20.14 20.5998 20.14 20.6698V44.5898C20.14 44.6798 20.12 44.7798 20.09 44.8698C20.12 44.9398 20.14 45.0198 20.14 45.0898C20.14 46.6298 15.64 47.8698 10.08 47.8698C4.52001 47.8698 0.0100098 46.6298 0.0100098 45.0898C0.0100098 45.0198 0.0300098 44.9398 0.0600098 44.8698C0.0300098 44.7798 0.0100098 44.6798 0.0100098 44.5898V20.6698C0.0100098 20.5798 0.0100098 20.4998 0.0500098 20.4298C0.0300098 20.2298 0.0200098 20.0198 0.0200098 19.8198V14.7098C9.76585e-06 12.3398 1.15001 10.5598 2.40001 10.9598C4.24001 11.5498 7.00001 11.9198 10.08 11.9198C13.16 11.9198 15.89 11.5498 17.73 10.9598C18.98 10.5498 20.13 12.3298 20.13 14.6998V19.8098L20.14 19.8198Z" fill="#DCDDDD"/>
          <path d="M16.02 25.8001C16.02 25.9201 16.02 26.0301 16 26.1401C16.01 26.1801 16.02 26.2201 16.02 26.2601V39.1401C16.02 39.1401 16.01 39.2401 15.98 39.2901C16 39.3301 16.02 39.3701 16.02 39.4101C16.02 40.2401 12.6 40.9101 8.37998 40.9101C4.15998 40.9101 0.72998 40.2401 0.72998 39.4101C0.72998 39.3701 0.73998 39.3301 0.76998 39.2901C0.74998 39.2401 0.72998 39.1901 0.72998 39.1401V26.2601C0.72998 26.2601 0.72998 26.1701 0.75998 26.1301C0.74998 26.0201 0.73998 25.9101 0.73998 25.8001V23.0501C0.73998 21.7701 1.60998 20.8201 2.55998 21.0401C3.95998 21.3601 6.04998 21.5601 8.38998 21.5601C10.73 21.5601 12.8 21.3601 14.2 21.0401C15.15 20.8201 16.02 21.7801 16.02 23.0501V25.8001Z" fill="#727171"/>
          <path d="M9.54999 33.0402C9.54999 33.0402 9.53999 33.0202 9.52998 33.0102C9.52998 33.0102 9.50999 32.9902 9.49999 32.9802C9.46999 32.9602 9.43999 32.9302 9.40999 32.9002C8.70999 32.2302 8.64998 31.6102 8.64998 31.6102C8.64998 31.5402 8.62998 31.4602 8.60998 31.3702C8.42999 30.6702 7.75999 30.2102 7.03999 30.2402H6.96999C6.25998 30.2302 5.60999 30.6802 5.42999 31.3702C5.40999 31.4502 5.39999 31.5402 5.38999 31.6202C5.38999 31.6202 5.32999 32.2302 4.62999 32.9002C4.59999 32.9302 4.56999 32.9602 4.53999 32.9802C4.53999 32.9802 4.51999 33.0002 4.50999 33.0102C4.50999 33.0102 4.48998 33.0302 4.48998 33.0402C4.24998 33.3002 4.10999 33.6402 4.10999 34.0102C4.10999 34.8302 4.79999 35.4902 5.65999 35.4902C5.93999 35.4902 6.18999 35.4202 6.41999 35.3002C6.42999 35.2902 6.48999 35.2402 6.56999 35.2002C6.66999 35.1502 6.81999 35.1002 6.99999 35.1102C7.18999 35.1102 7.32999 35.1502 7.42999 35.2002C7.51998 35.2402 7.56999 35.2802 7.57999 35.3002C7.79999 35.4202 8.05999 35.4902 8.33999 35.4902C9.19999 35.4902 9.88999 34.8302 9.88999 34.0102C9.88999 33.6402 9.74999 33.3002 9.50999 33.0402H9.54999Z" fill="#DCDDDD"/>
          <path d="M4.39001 31.52C4.39001 32.06 3.98001 32.5 3.48001 32.5C2.98001 32.5 2.57001 32.06 2.57001 31.52C2.57001 31.25 2.67001 31 2.84001 30.83C2.90001 30.76 2.93001 30.69 2.94001 30.66V30.65V30.6C2.99001 30.24 3.25001 29.98 3.57001 29.98C3.93001 29.98 4.21001 30.33 4.21001 30.76C4.21001 30.76 4.21001 30.92 4.24001 31C4.24001 31 4.25001 31.01 4.25001 31.02C4.33001 31.17 4.39001 31.35 4.39001 31.54V31.52Z" fill="#DCDDDD"/>
          <path d="M6.64001 28.4799C6.64001 29.0199 6.23001 29.4599 5.73001 29.4599C5.23001 29.4599 4.82001 29.0199 4.82001 28.4799C4.82001 28.2099 4.92001 27.9599 5.09001 27.7899C5.15001 27.7199 5.18001 27.6499 5.19001 27.6199V27.6099V27.5599C5.24001 27.1999 5.50001 26.9399 5.82001 26.9399C6.18001 26.9399 6.46001 27.2899 6.46001 27.7199C6.46001 27.7199 6.46001 27.8799 6.49001 27.9599C6.49001 27.9599 6.50001 27.9699 6.50001 27.9799C6.58001 28.1299 6.64001 28.3099 6.64001 28.4999V28.4799Z" fill="#DCDDDD"/>
          <path d="M9.48999 31.52C9.48999 32.06 9.89999 32.5 10.4 32.5C10.9 32.5 11.31 32.06 11.31 31.52C11.31 31.25 11.21 31 11.04 30.83C10.98 30.76 10.95 30.69 10.94 30.66V30.65V30.6C10.89 30.24 10.63 29.98 10.31 29.98C9.94999 29.98 9.66999 30.33 9.66999 30.76C9.66999 30.76 9.66999 30.92 9.63999 31C9.63999 31 9.62999 31.01 9.62999 31.02C9.54999 31.17 9.48999 31.35 9.48999 31.54V31.52Z" fill="#DCDDDD"/>
          <path d="M7.23999 28.4799C7.23999 29.0199 7.64999 29.4599 8.14999 29.4599C8.64999 29.4599 9.05999 29.0199 9.05999 28.4799C9.05999 28.2099 8.95999 27.9599 8.78999 27.7899C8.72999 27.7199 8.69999 27.6499 8.68999 27.6199V27.6099V27.5599C8.63999 27.1999 8.37999 26.9399 8.05999 26.9399C7.69999 26.9399 7.41999 27.2899 7.41999 27.7199C7.41999 27.7199 7.41999 27.8799 7.38999 27.9599C7.38999 27.9599 7.37999 27.9699 7.37999 27.9799C7.29999 28.1299 7.23999 28.3099 7.23999 28.4999V28.4799Z" fill="#DCDDDD"/>
          </g>
          <defs>
          <clipPath id="clip0_300_1885">
          <rect width="20.14" height="47.88" fill="white"/>
          </clipPath>
          </defs>
          </svg>
          ''',
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}