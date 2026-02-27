import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:touchline_template_puum0i/cms/combined_c_m_s_v1/combined_c_m_s_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/sponsor_ad_carousel_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/vote_non_fixture_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/league_table/league_table_v2/league_table_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/next_fixture_sliders/next_fixtures_slider_v2/next_fixtures_slider_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/social_icons/social_icons_v2/social_icons_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/squad_hub/squad_hub_slider_v3/squad_hub_slider_v3_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/customtitlev1/customtitlev1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/league_table_title_v2/league_table_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/next_up_title_v2/next_up_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/social_media_title_v2/social_media_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/squad_hub_title_v2/squad_hub_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/vote_now_title_v2/vote_now_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/x_latest_title_v2/x_latest_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_home/top_bit_v3_home_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/x_feed/x_feed_v3/x_feed_v3_widget.dart'
    as touchline_template_puum0i;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - initalRoute] action in Home widget.
  String? newToken;
  // Stores action output result for [Custom Action - setNavBarPadding] action in Home widget.
  double? bottomPadding;
  // Model for TopBitV3Home component.
  late touchline_template_puum0i.TopBitV3HomeModel topBitV3HomeModel;
  // Model for NextUpTitleV2 component.
  late touchline_template_puum0i.NextUpTitleV2Model nextUpTitleV2Model;
  // Model for NextFixturesSliderV2 component.
  late touchline_template_puum0i.NextFixturesSliderV2Model
      nextFixturesSliderV2Model;
  // Model for LeagueTableTitleV2 component.
  late touchline_template_puum0i.LeagueTableTitleV2Model
      leagueTableTitleV2Model;
  // Model for LeagueTableV2 component.
  late touchline_template_puum0i.LeagueTableV2Model leagueTableV2Model;
  // Model for VoteNowTitleV2 component.
  late touchline_template_puum0i.VoteNowTitleV2Model voteNowTitleV2Model;
  // Model for VoteNonFixtureV1 component.
  late touchline_template_puum0i.VoteNonFixtureV1Model voteNonFixtureV1Model;
  // Model for sponsorAdCarouselV1 component.
  late touchline_template_puum0i.SponsorAdCarouselV1Model
      sponsorAdCarouselV1Model;
  // Model for CUSTOMTITLEV1 component.
  late touchline_template_puum0i.Customtitlev1Model customtitlev1Model;
  // Model for CombinedCMSV1 component.
  late touchline_template_puum0i.CombinedCMSV1Model combinedCMSV1Model;
  // Model for SquadHubTitleV2 component.
  late touchline_template_puum0i.SquadHubTitleV2Model squadHubTitleV2Model;
  // Model for SquadHubSliderV3 component.
  late touchline_template_puum0i.SquadHubSliderV3Model squadHubSliderV3Model;
  // Model for XLatestTitleV2 component.
  late touchline_template_puum0i.XLatestTitleV2Model xLatestTitleV2Model;
  // Model for XFeedV3 component.
  late touchline_template_puum0i.XFeedV3Model xFeedV3Model;
  // Model for SocialMediaTitleV2 component.
  late touchline_template_puum0i.SocialMediaTitleV2Model
      socialMediaTitleV2Model;
  // Model for SocialIconsV2 component.
  late touchline_template_puum0i.SocialIconsV2Model socialIconsV2Model;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    topBitV3HomeModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.TopBitV3HomeModel());
    nextUpTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.NextUpTitleV2Model());
    nextFixturesSliderV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.NextFixturesSliderV2Model());
    leagueTableTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LeagueTableTitleV2Model());
    leagueTableV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LeagueTableV2Model());
    voteNowTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.VoteNowTitleV2Model());
    voteNonFixtureV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.VoteNonFixtureV1Model());
    sponsorAdCarouselV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.SponsorAdCarouselV1Model());
    customtitlev1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.Customtitlev1Model());
    combinedCMSV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.CombinedCMSV1Model());
    squadHubTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.SquadHubTitleV2Model());
    squadHubSliderV3Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.SquadHubSliderV3Model());
    xLatestTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.XLatestTitleV2Model());
    xFeedV3Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.XFeedV3Model());
    socialMediaTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.SocialMediaTitleV2Model());
    socialIconsV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.SocialIconsV2Model());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    topBitV3HomeModel.dispose();
    nextUpTitleV2Model.dispose();
    nextFixturesSliderV2Model.dispose();
    leagueTableTitleV2Model.dispose();
    leagueTableV2Model.dispose();
    voteNowTitleV2Model.dispose();
    voteNonFixtureV1Model.dispose();
    sponsorAdCarouselV1Model.dispose();
    customtitlev1Model.dispose();
    combinedCMSV1Model.dispose();
    squadHubTitleV2Model.dispose();
    squadHubSliderV3Model.dispose();
    xLatestTitleV2Model.dispose();
    xFeedV3Model.dispose();
    socialMediaTitleV2Model.dispose();
    socialIconsV2Model.dispose();
    navbarModel.dispose();
  }
}
