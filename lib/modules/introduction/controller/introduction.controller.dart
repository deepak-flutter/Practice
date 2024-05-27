import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/assets.utils.dart';

class IntroductionController extends GetxController{
  final List<SingleIntroScreen> pages = [
    const SingleIntroScreen(
      title: 'Welcome to NewsFlick!',
      description: 'Stay informed with the latest events and developments from around the world, delivered right to you.',
      imageNetwork: "https://img.freepik.com/free-vector/coronavirus-update-concept_23-2148733120.jpg?w=826&t=st=1716810995~exp=1716811595~hmac=468af96398208c0108c73e6391de66f9202e6b5f8fa55b107b768d188b4481e9",
    ),
    const SingleIntroScreen(
      title: 'Read shorts news quickly!',
      description: 'Read news in brief! Get quick updates on the latest events and developments with our concise news summaries.',
      imageNetwork: "https://img.freepik.com/free-vector/coronavirus-news-update-illustration_52683-51043.jpg?t=st=1716810580~exp=1716814180~hmac=dc97a1e81e66ca57681b7236d462a023d00e5f298bd97cfb62e7f3350c92fd98&w=826",
    ),
    const SingleIntroScreen(
      title: 'Listen to news!',
      description: 'Listen to news! Stay updated with the latest events and developments through our concise audio summaries.',
      imageNetwork: "https://img.freepik.com/free-vector/coronavirus-news-update-illustration_52683-51042.jpg?w=826&t=st=1716811115~exp=1716811715~hmac=b7d9d96ffba089498a69aea83b39173841ae0c93661dcf07ca4f87289f01a19f",
    ),
  ];

}