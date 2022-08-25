import 'package:equatable/equatable.dart';

class LogIn extends Equatable {
  final String userNameOrEmailAddress;
  final String password;
  final String rememberClient;

  const LogIn(
      {required this.userNameOrEmailAddress,
      required this.password,
      required this.rememberClient});

  @override
  List<Object?> get props => [userNameOrEmailAddress, password, rememberClient];
}

/*{
  "userNameOrEmailAddress": "string",
  "password": "string",
  "rememberClient": true
}*/


//response on code 200 is 

/*{
  "result": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjQwIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Im1zYUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJtc2FAZ21haWwuY29tIiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiJCN01aS0NFV0QyVUVHQVMzNTNOM01BQUIyUEFUWDdTMiIsInN1YiI6IjQwIiwianRpIjoiNDI5NmZkN2QtNGVkMC00NmQ4LWI0MTQtOWI5YTczMTIwMDg1IiwiaWF0IjoxNjYwMzI4MzU4LCJuYmYiOjE2NjAzMjgzNTgsImV4cCI6MTY2MDQxNDc1OCwiaXNzIjoiQW5kcm9pZFRlc3QiLCJhdWQiOiJBbmRyb2lkVGVzdCJ9.j0QRSQ_vXNJYLrd_HtJ96McqNsLfD4u3yoo_Quosimo",
    "encryptedAccessToken": "9hIPrO2Ilmq4H8evkUz4aMrynDDDwuTIafOtHPEwNbteYLTdcBakjv7lR0YShkxiNwzUg0x4fef16IRdMoyngo1jhAS05Fu8uwZ/djA0Q+sBJgGVvAInLyh0C4MFHKKHNhcFVQEwxYxovwClpnbRmxErJXdWtNra0LJmxl2AkoZmDMVBrw3ZbtY9/bnG8Tejxjvm6kvyIVYeuzQnoZfqV133Ww4SyEY1TE5VWQ3gDnnPSLX7wyEoGEP7D3pVjo74hHdVZ5EyWAHoI1qp0BnTsJ1n0zlKcQUpX7LbMDMr4h+82MBAfdTtrNjPkIzXy+B6dWIEgQfma1CZCSzCe8noyoB3JI97TnCKZHZEafIGQC8KF9HliKGeISm2EE+jAy+4bUA5M1gLOFmeyJzjhdaxeDAXf4mirR7fTCYHUfB7tfosTLmMQFl5ggnB40+S7truS/npnDGfzWaDZWUyoNgwOSEsfL6xMEM39/VSFVJLF2QsHd/zrA0Fkq7Z/Rx7VRjcwhIjw2IHJxAJzB9/Z3cA7JgutlADn++j2Lac9Hc8t8LQt/0pkFv1uqbzDfqTJ51JKFLvMA4D5dbNlGfft+13Ha5HtTbaVZs/mIbXyqEQzJapwcBR/JH4oupNO/EPbofEn+/dIzI8gsNgmE2fgTkSA0Rdqr7i9RUiA50t9P8z8ctfWP6UfwyZOHCUZppHspDBlj8PjJ0fBegf5YDPIMflTyO5N7Bkzze1Q1Ul6r8jewJz8n2OeNsFpfg/io1paDiWTtCefFM8ErGURk3y/SVYc5awigU5JhZd3083ywC3eSB107Pc+KHeAqJihVGwCFlPDeTBOP7YeHWcKA4JX++9ih5dqkleqPHlBC9sa0h0ZMi21U60yOf4a6EQblp74ngscAOPL8z8uI4cGeVSPIz4LQ==",
    "expireInSeconds": 86400,
    "userId": 40
  },
  "targetUrl": null,
  "success": true,
  "error": null,
  "unAuthorizedRequest": false,
  "__abp": true
} */