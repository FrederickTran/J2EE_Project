<%-- 
    Document   : Home
    Created on : Mar 26, 2017, 9:57:47 AM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Music</title>
        <!--CSS-->
    <link type="text/css" rel="stylesheet" href="css/color_table.css"/>
    <link type="text/css" rel="stylesheet" href="css/layout.css"/>
    <link type="text/css" rel="stylesheet" href="css/random_style.css"/>
    <link type="text/css" rel="stylesheet" href="css/boostrap/css/bootstrap.css"/>

    <link type="text/css" rel="stylesheet" href="css/navigation_2/navigation_bar_2.css"/>
    <link type="text/css" rel="stylesheet" href="css/gallery_1/gallery_1.css"/>
    <link type="text/css" rel="stylesheet" href="css/side_bench_1/side_bench_1.css"/>
    <link type="text/css" rel="stylesheet" href="css/search_box_1/search_box_1.css"/>
    <link type="text/css" rel="stylesheet" href="css/media/song_list.css"/>
    <link type="text/css" rel="stylesheet" href="css/media/song_item.css"/>
    <link type="text/css" rel="stylesheet" href="css/media/player.css">
    <link type="text/css" rel="stylesheet" href="css/modal_1/modal_1.css">
    
    <!--JAVASCRIPT-->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/generic_values.js"></script>
    <script src="js/generic_function.js"></script>
    <script src="js/link_table.js"></script>
    <script src="js/generator.js"></script>
    <script src="js/index_action.js"></script>
    </head>
    <body>
        <div class="backgroundLayer"></div> <!-- div background -->
<div class="background01"></div> <!-- div background -->
<div class="container-fluid full" style="height: 100%; padding: 0; margin: 0;">
    <div class="row no_gutter">
        <div style="width: 100%;">
            <nav class="navbar-default" style="padding-left: 5%; padding-right: 5%" id="nav_before_login">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="ref_main_page" onclick="getLink(this)"><img src="res/icon.png" class="navbar-brand"/></a>
                        
                    </div>
                    <ul class="nav navbar-right navbar-nav">
                        <li><a href="#" onclick="searchWithKey()">FAQ</a></li>
                        <li><a href="#" onclick="searchWithKey()">About Us</a></li>
                        <li><a href="#" onclick="searchWithKey()">Payment</a></li>
                        <li><a href="#" onclick="searchWithKey()">Policy</a></li>
                        <li><a href="#" onclick="searchWithKey()">Term of service</a></li>
                        <li><a href="#" onclick="randomPlaylist()">Random free song</a></li>
                        <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_in">Sign In</button></li>
                        <li><a href="#" data-toggle="modal" data-target="#modal_sign_up">Sign Up</a></li>
                    </ul>
                </div>
            </nav> <!-- navbar-default -->

            <nav class="navbar-default" style="padding-left: 5%; padding-right: 5%; display: none;" id="nav_after_login">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="ref_main_page" onclick="getLink(this)"><img src="res/icon.png" class="navbar-brand"/></a>
                    </div>
                    <ul class="nav navbar-right navbar-nav">
                        <li><a href="#" onclick="searchWithKey()">Top</a></li>
                        <li><a href="#" onclick="addMyList()">My Playlist</a></li>
                        <li><a href="#" onclick="addMySong()">My Song</a></li>
                        <li><a href="#" onclick="randomPlaylist()">Random</a></li>
                        <li><a href="#" onclick="searchWithKey()">My Accout</a></li>
                        <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_out">Sign Out</button></li>
                    
                    </ul>
                </div>
            </nav> <!-- navbar-default -->
        </div>
    </div> <!--row-->

    <div class="row main no_gutter main_content_table">
        <div class="main_content_table_cell full_expand smooth_transform" align="center" id="main_search_box">
            <div class="form-group search_box_1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <img class="logo" src="res/logo.png" style="display: block">
                            <input type="text" class="form-control" id="main_search_box_key_word" onkeypress="onSearchBoxKeyPress(event)">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-default" onclick="searchWithKey()">Search for song</button>
                            <button class="btn btn-default" onclick="openTermOfService()">Term of service</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid main_content_table_cell full_expand smooth_transform" id="side_bench_media_player" style="padding: 0; width: 0%; height: 100%; background: var(--alpha70color10);">
            <div class="row no_gutter" style="height: 10vh; position: relative;">
                <div class="media_player full_expand" id="media_player_UI" style="display: none; opacity: 0;">
                    <div class="col-md-2 full_expand" id="play_button">
                        <a><i class="glyphicon glyphicon-play-circle"></i></a>
                    </div>
                    <div class="col-md-10 full_expand song_item" id="playing_song">
                        <p class="song_name" id="playing_song_name"></p>
                        <hr/>
                        <p class="song_musician" id="playing_song_musician"></p>
                    </div>
                </div>
                <p style="font-size: x-small; display: none; padding: 5px; background: var(--color13);
                 color: var(--color09); z-index: var(--z_side_bench_control); vertical-align: baseline;
                 position: relative;" id="media_player_demo_sign">
                    *This is demo version, you can only listen for 10 seconds.
                    <a href="#" data-toggle="modal" data-target="modal_buy_confirm" style="background: var(--color09); padding: 6px; vertical-align: baseline;">Buy now</a>
                </p>
            </div>

            <div class="row no_gutter" style="height: 81vh; position: relative;">
                <div id="song_list_player" class="song_list has_scrollbar" style="padding: 0; margin: 10px 0px 0px 0px; position: relative; bottom: 0;">
                    <!--<div class="song_item">-->
                        <!--<p class="song_name">Virus</p>-->
                        <!--<p class="song_musician">Beethoven</p>-->
                        <!--<hr/>-->
                    <!--</div>-->
                </div>
            </div>
        </div>

        <div class="main_content_table_cell has_scrollbar smooth_transform" id="side_bench_search_list" style="width: 0%; height: 100%; background: var(--alpha40color10);">
            <div id="song_list_search" class="song_list" style="padding: 0;">
                <!--<div class="song_item" data-toggle="collapse" data-target="#control_panel">-->
                <!--<img src="mar/disk_mp3.png" style="opacity: 0.1; position: fixed"/>-->

                <!--<div class="collapse control_item" id="control_panel">-->
                <!--<a href="add-song"><i class="glyphicon glyphicon-plus"></i></a>-->
                <!--<a href="play-song"><i class="glyphicon glyphicon-share"></i></a>-->
                <!--<a href="play-song"><i class="glyphicon glyphicon-heart"></i></a>-->
                <!--</div>-->

                <!--<p class="song_name">Virus</p>-->
                <!--<p class="song_musician">Beethoven</p>-->
                <!--<hr/>-->
                <!--</div>-->
            </div>
        </div>

    </div> <!--row-->

    <!--<div style="width: 100%; background-color: red; height: 5%">Footer</div>-->
</div> <!--container-->

<!-- Sign up -->
<div id="modal_sign_up" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sign Up</h4>
      </div>
      <div class="modal-body">
          <div class="form-group container-fluid">
              <div class="attention_block row">
                  <p>
                      Beside of Free songs, some other songs in this site is require payment, please make sure you have read our <nobr><a href="#" onclick="openTermOfService()">Term of Service</a></nobr> before continue.
                  </p>
              </div>
              <div class="row">
                  <label for="user_input_user_name" class="col-md-4">Full name:</label>
                  <input type="text" style="width: 50%" id="user_input_user_name"/>
              </div>

              <div class="row">
                  <label for="user_input_user_loginid" class="col-md-4">Login ID:</label>
                  <input type="text" style="width: 50%" id="user_input_user_loginid" required/>
              </div>

              <div class="row">
                  <label for="user_input_user_password" class="col-md-4">Password:</label>
                  <input type="password" style="width: 50%" id="user_input_user_password" required/>
              </div>

              <div class="row">
                  <label for="user_input_user_confirm_password" class="col-md-4">Confirm Password:</label>
                  <input type="password" style="width: 50%" id="user_input_user_confirm_password" required/>
              </div>

              <!--<div class="row">-->
                  <!--<label for="user_input_DOB" class="col-md-4">Your birthday:</label>-->
                  <!--<input type="date" style="width: 50%" id="user_input_DOB" required/>-->
              <!--</div>-->

              <label style="margin-top: 10px;;">Payment information:</label>
              <form action="" method="POST" id="payment-form" class="container-fluid" style="border: solid var(--color07) 1px; padding: 0px 0px 10px 0px;">
                  <div class="row">
                      <label class="col-md-4">Name</label>
                      <input type="text" size="20" autocomplete="off" class="name" required>
                  </div>
                  <div class="row">
                      <label class="col-md-4">Address Line 1</label>
                      <input type="text" size="20" autocomplete="off" class="address_line1" required>
                  </div>
                  <div class="row">
                      <label class="col-md-4">Address Line 2</label>
                      <input type="text" size="20" autocomplete="off" class="address_line2">
                  </div>
                  <div class="row">
                      <label class="col-md-4">Address Zip</label>
                      <input type="text" size="20" autocomplete="off" class="address_zip" required>
                  </div>
                  <div class="row">
                      <label class="col-md-4">Address Country</label>
                      <select class="address_country" style="width: 50%;" required>
                          <option value=""></option>
                          <option value="AF">Afghanistan</option>
                          <option value="AX">Åland Islands</option>
                          <option value="AL">Albania</option>
                          <option value="DZ">Algeria</option>
                          <option value="AS">American Samoa</option>
                          <option value="AD">Andorra</option>
                          <option value="AO">Angola</option>
                          <option value="AI">Anguilla</option>
                          <option value="AQ">Antarctica</option>
                          <option value="AG">Antigua and Barbuda</option>
                          <option value="AR">Argentina</option>
                          <option value="AM">Armenia</option>
                          <option value="AW">Aruba</option>
                          <option value="AU">Australia</option>
                          <option value="AT">Austria</option>
                          <option value="AZ">Azerbaijan</option>
                          <option value="BS">Bahamas</option>
                          <option value="BH">Bahrain</option>
                          <option value="BD">Bangladesh</option>
                          <option value="BB">Barbados</option>
                          <option value="BY">Belarus</option>
                          <option value="BE">Belgium</option>
                          <option value="BZ">Belize</option>
                          <option value="BJ">Benin</option>
                          <option value="BM">Bermuda</option>
                          <option value="BT">Bhutan</option>
                          <option value="BO">Bolivia</option>
                          <option value="BA">Bosnia and Herzegovina</option>
                          <option value="BW">Botswana</option>
                          <option value="BV">Bouvet Island</option>
                          <option value="BR">Brazil</option>
                          <option value="IO">British Indian Ocean Territory</option>
                          <option value="BN">Brunei Darussalam</option>
                          <option value="BG">Bulgaria</option>
                          <option value="BF">Burkina Faso</option>
                          <option value="BI">Burundi</option>
                          <option value="KH">Cambodia</option>
                          <option value="CM">Cameroon</option>
                          <option value="CA">Canada</option>
                          <option value="CV">Cape Verde</option>
                          <option value="KY">Cayman Islands</option>
                          <option value="CF">Central African Republic</option>
                          <option value="TD">Chad</option>
                          <option value="CL">Chile</option>
                          <option value="CN">China</option>
                          <option value="CX">Christmas Island</option>
                          <option value="CC">Cocos (Keeling) Islands</option>
                          <option value="CO">Colombia</option>
                          <option value="KM">Comoros</option>
                          <option value="CG">Congo</option>
                          <option value="CD">Congo, The Democratic Republic of The</option>
                          <option value="CK">Cook Islands</option>
                          <option value="CR">Costa Rica</option>
                          <option value="CI">Cote D'ivoire</option>
                          <option value="HR">Croatia</option>
                          <option value="CU">Cuba</option>
                          <option value="CY">Cyprus</option>
                          <option value="CZ">Czech Republic</option>
                          <option value="DK">Denmark</option>
                          <option value="DJ">Djibouti</option>
                          <option value="DM">Dominica</option>
                          <option value="DO">Dominican Republic</option>
                          <option value="EC">Ecuador</option>
                          <option value="EG">Egypt</option>
                          <option value="SV">El Salvador</option>
                          <option value="GQ">Equatorial Guinea</option>
                          <option value="ER">Eritrea</option>
                          <option value="EE">Estonia</option>
                          <option value="ET">Ethiopia</option>
                          <option value="FK">Falkland Islands (Malvinas)</option>
                          <option value="FO">Faroe Islands</option>
                          <option value="FJ">Fiji</option>
                          <option value="FI">Finland</option>
                          <option value="FR">France</option>
                          <option value="GF">French Guiana</option>
                          <option value="PF">French Polynesia</option>
                          <option value="TF">French Southern Territories</option>
                          <option value="GA">Gabon</option>
                          <option value="GM">Gambia</option>
                          <option value="GE">Georgia</option>
                          <option value="DE">Germany</option>
                          <option value="GH">Ghana</option>
                          <option value="GI">Gibraltar</option>
                          <option value="GR">Greece</option>
                          <option value="GL">Greenland</option>
                          <option value="GD">Grenada</option>
                          <option value="GP">Guadeloupe</option>
                          <option value="GU">Guam</option>
                          <option value="GT">Guatemala</option>
                          <option value="GG">Guernsey</option>
                          <option value="GN">Guinea</option>
                          <option value="GW">Guinea-bissau</option>
                          <option value="GY">Guyana</option>
                          <option value="HT">Haiti</option>
                          <option value="HM">Heard Island and Mcdonald Islands</option>
                          <option value="VA">Holy See (Vatican City State)</option>
                          <option value="HN">Honduras</option>
                          <option value="HK">Hong Kong</option>
                          <option value="HU">Hungary</option>
                          <option value="IS">Iceland</option>
                          <option value="IN">India</option>
                          <option value="ID">Indonesia</option>
                          <option value="IR">Iran, Islamic Republic of</option>
                          <option value="IQ">Iraq</option>
                          <option value="IE">Ireland</option>
                          <option value="IM">Isle of Man</option>
                          <option value="IL">Israel</option>
                          <option value="IT">Italy</option>
                          <option value="JM">Jamaica</option>
                          <option value="JP">Japan</option>
                          <option value="JE">Jersey</option>
                          <option value="JO">Jordan</option>
                          <option value="KZ">Kazakhstan</option>
                          <option value="KE">Kenya</option>
                          <option value="KI">Kiribati</option>
                          <option value="KP">Korea, Democratic People's Republic of</option>
                          <option value="KR">Korea, Republic of</option>
                          <option value="KW">Kuwait</option>
                          <option value="KG">Kyrgyzstan</option>
                          <option value="LA">Lao People's Democratic Republic</option>
                          <option value="LV">Latvia</option>
                          <option value="LB">Lebanon</option>
                          <option value="LS">Lesotho</option>
                          <option value="LR">Liberia</option>
                          <option value="LY">Libyan Arab Jamahiriya</option>
                          <option value="LI">Liechtenstein</option>
                          <option value="LT">Lithuania</option>
                          <option value="LU">Luxembourg</option>
                          <option value="MO">Macao</option>
                          <option value="MK">Macedonia, The Former Yugoslav Republic of</option>
                          <option value="MG">Madagascar</option>
                          <option value="MW">Malawi</option>
                          <option value="MY">Malaysia</option>
                          <option value="MV">Maldives</option>
                          <option value="ML">Mali</option>
                          <option value="MT">Malta</option>
                          <option value="MH">Marshall Islands</option>
                          <option value="MQ">Martinique</option>
                          <option value="MR">Mauritania</option>
                          <option value="MU">Mauritius</option>
                          <option value="YT">Mayotte</option>
                          <option value="MX">Mexico</option>
                          <option value="FM">Micronesia, Federated States of</option>
                          <option value="MD">Moldova, Republic of</option>
                          <option value="MC">Monaco</option>
                          <option value="MN">Mongolia</option>
                          <option value="ME">Montenegro</option>
                          <option value="MS">Montserrat</option>
                          <option value="MA">Morocco</option>
                          <option value="MZ">Mozambique</option>
                          <option value="MM">Myanmar</option>
                          <option value="NA">Namibia</option>
                          <option value="NR">Nauru</option>
                          <option value="NP">Nepal</option>
                          <option value="NL">Netherlands</option>
                          <option value="AN">Netherlands Antilles</option>
                          <option value="NC">New Caledonia</option>
                          <option value="NZ">New Zealand</option>
                          <option value="NI">Nicaragua</option>
                          <option value="NE">Niger</option>
                          <option value="NG">Nigeria</option>
                          <option value="NU">Niue</option>
                          <option value="NF">Norfolk Island</option>
                          <option value="MP">Northern Mariana Islands</option>
                          <option value="NO">Norway</option>
                          <option value="OM">Oman</option>
                          <option value="PK">Pakistan</option>
                          <option value="PW">Palau</option>
                          <option value="PS">Palestinian Territory, Occupied</option>
                          <option value="PA">Panama</option>
                          <option value="PG">Papua New Guinea</option>
                          <option value="PY">Paraguay</option>
                          <option value="PE">Peru</option>
                          <option value="PH">Philippines</option>
                          <option value="PN">Pitcairn</option>
                          <option value="PL">Poland</option>
                          <option value="PT">Portugal</option>
                          <option value="PR">Puerto Rico</option>
                          <option value="QA">Qatar</option>
                          <option value="RE">Reunion</option>
                          <option value="RO">Romania</option>
                          <option value="RU">Russian Federation</option>
                          <option value="RW">Rwanda</option>
                          <option value="SH">Saint Helena</option>
                          <option value="KN">Saint Kitts and Nevis</option>
                          <option value="LC">Saint Lucia</option>
                          <option value="PM">Saint Pierre and Miquelon</option>
                          <option value="VC">Saint Vincent and The Grenadines</option>
                          <option value="WS">Samoa</option>
                          <option value="SM">San Marino</option>
                          <option value="ST">Sao Tome and Principe</option>
                          <option value="SA">Saudi Arabia</option>
                          <option value="SN">Senegal</option>
                          <option value="RS">Serbia</option>
                          <option value="SC">Seychelles</option>
                          <option value="SL">Sierra Leone</option>
                          <option value="SG">Singapore</option>
                          <option value="SK">Slovakia</option>
                          <option value="SI">Slovenia</option>
                          <option value="SB">Solomon Islands</option>
                          <option value="SO">Somalia</option>
                          <option value="ZA">South Africa</option>
                          <option value="GS">South Georgia and The South Sandwich Islands</option>
                          <option value="ES">Spain</option>
                          <option value="LK">Sri Lanka</option>
                          <option value="SD">Sudan</option>
                          <option value="SR">Suriname</option>
                          <option value="SJ">Svalbard and Jan Mayen</option>
                          <option value="SZ">Swaziland</option>
                          <option value="SE">Sweden</option>
                          <option value="CH">Switzerland</option>
                          <option value="SY">Syrian Arab Republic</option>
                          <option value="TW">Taiwan</option>
                          <option value="TJ">Tajikistan</option>
                          <option value="TZ">Tanzania, United Republic of</option>
                          <option value="TH">Thailand</option>
                          <option value="TL">Timor-leste</option>
                          <option value="TG">Togo</option>
                          <option value="TK">Tokelau</option>
                          <option value="TO">Tonga</option>
                          <option value="TT">Trinidad and Tobago</option>
                          <option value="TN">Tunisia</option>
                          <option value="TR">Turkey</option>
                          <option value="TM">Turkmenistan</option>
                          <option value="TC">Turks and Caicos Islands</option>
                          <option value="TV">Tuvalu</option>
                          <option value="UG">Uganda</option>
                          <option value="UA">Ukraine</option>
                          <option value="AE">United Arab Emirates</option>
                          <option value="GB">United Kingdom</option>
                          <option value="US">United States</option>
                          <option value="UM">United States Minor Outlying Islands</option>
                          <option value="UY">Uruguay</option>
                          <option value="UZ">Uzbekistan</option>
                          <option value="VU">Vanuatu</option>
                          <option value="VE">Venezuela</option>
                          <option value="VN">Viet Nam</option>
                          <option value="VG">Virgin Islands, British</option>
                          <option value="VI">Virgin Islands, U.S.</option>
                          <option value="WF">Wallis and Futuna</option>
                          <option value="EH">Western Sahara</option>
                          <option value="YE">Yemen</option>
                          <option value="ZM">Zambia</option>
                          <option value="ZW">Zimbabwe</option>
                      </select>
                  </div>
                  <div class="row">
                      <label class="col-md-4">Card Number</label>
                      <input type="text" size="20" autocomplete="off" class="card-number" value="" required>
                  </div>
                  <div class="row">
                      <div class="col-md-4">
                        <label>CVV Code<br><span class="hint">last 3 digits -&gt;</span></label><img src="mar/cvv.png" alt="CVV" style="margin-left: 10px">
                      </div>
                      <input type="text" size="4" autocomplete="off" class="card-cvc" value="" required>
                  </div>
                  <div class="row">
                      <label class="col-md-4">Expiration (MM/YY)</label>
                      <input type="text" size="2" maxlength="2" class="card-expiry-month" value="" required><label style="font-size: large; padding-left: 5px">/</label>
                      <input type="text" size="2" maxlength="2" class="card-expiry-year" value="" required>
                  </div>
                  <div class="clear"></div>
              </form>
          </div>
      </div>
      <div class="modal-footer">
          I have read and accept <nobr><a href="#" onclick="openTermOfService(this)">Term of Service</a></nobr> <input type="checkbox" onchange="onTermOfServiceCheckboxChange(this)">
          <button type="submit" class="btn btn-default" disabled id="btn_sign_up" onclick="signUp()">Sign Up</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<!-- Sign in -->
<div id="modal_sign_in" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sign In</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                    <div class="row">
                        <label for="user_input_sign_in_ID" class="col-md-3">Login ID:</label>
                        <input type="text" style="width: 50%" id="user_input_sign_in_ID"/>
                    </div>

                    <div class="row">
                        <label for="user_input_sign_in_password" class="col-md-3">Password:</label>
                        <input type="password" style="width: 50%" id="user_input_sign_in_password"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <p style="position: absolute; float: left;">Don't have an account yet? <nobr><a data-dismiss="modal" data-toggle="modal" data-target="#modal_sign_up" style="cursor: pointer;">Sign Up</a></nobr> now.</p>
                <button type="submit" class="btn btn-default" onclick="loginFormLogin(this)" style="position: relative;">Sign In</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_sign_out" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sign Out</h4>
            </div>
            <div class="modal-body">
                <p style="padding-top: 20px">You will unable to access the songs you have buy until you login again.</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default" onclick="logout()" data-dismiss="modal">Sign Out</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_sign_up_successful" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sign Up Successful</h4>
            </div>
            <div class="modal-body">
                <p style="padding-top: 20px; margin: 0;">Welcome to Rhythms X.<br>
                    Offline Rhythms X is in development, please keep in mind that download and publish songs from Rhytms X with any third party software is violate our
                    <nobr><a href="#" onclick="openTermOfService()">Term of service</a></nobr><br></p>
                </p>
            </div>
            <div class="modal-footer" style="padding-top: 20px">
                <button type="submit" class="btn btn-default" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_buy_confirm" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Buy this song</h4>
            </div>
            <div class="modal-body">
                <p style="padding-top: 20px; margin: 0;">You didn't buy this song, yet. What would you like to do?<br>You currently have: 0 free song(s) left.</p><br>
                <p style="font-size: medium; font-weight: 600; color: var(--color13);">This song will cost you: $0.32</p>
                <div style="padding: 10px; margin: 0; border: 1px solid var(--color07); border-radius: 0px;">
                    <p>Your current payment information:</p>
                    <p>Name:</p>
                    <p>Address:</p>
                    <p>Card ID:</p>
                </div>
            </div>
            <div class="modal-footer" style="padding-top: 20px">
                <button type="submit" class="btn btn-default" data-dismiss="modal">Buy this song</button>
                <button type="submit" class="btn btn-default" data-dismiss="modal">Listen for 10 seconds</button>
                <button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_term_of_service" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Term of service</h4>
            </div>
            <div class="modal-body has_scrollbar" style="height: 75vh;">
                <p style="margin: 0;">
                    <p style="font-size: large; font-weight: 600; padding-bottom: 0px; padding-top: 20px;">Privacy and Copyright Protection</p><br>

Rhythms X’s privacy policies explain how we treat your personal data and protect your privacy when you use our Services. By using our Services, you agree that Rhythms X can use such data in accordance with our privacy policies.<br>

We respond to notices of alleged copyright infringement and terminate accounts of repeat infringers according to the process set out in the U.S. Digital Millennium Copyright Act.<br>

We provide information to help copyright holders manage their intellectual property online. If you think somebody is violating your copyrights and want to notify us, you can find information about submitting notices and Rhythms X’s policy about responding to notices in our Help Center.<br>

<p style="font-size: large; font-weight: 600; padding-bottom: 0px; padding-top: 20px;">Your Content in our Services</p><br>

Some of our Services allow you to upload, submit, store, send or receive content. You retain ownership of any intellectual property rights that you hold in that content. In short, what belongs to you stays yours.<br>

When you upload, submit, store, send or receive content to or through our Services, you give Rhythms X (and those we work with) a worldwide license to use, host, store, reproduce, modify, create derivative works (such as those resulting from translations, adaptations or other changes we make so that your content works better with our Services), communicate, publish, publicly perform, publicly display and distribute such content. The rights you grant in this license are for the limited purpose of operating, promoting, and improving our Services, and to develop new ones. This license continues even if you stop using our Services (for example, for a business listing you have added to Rhythms X Maps). Some Services may offer you ways to access and remove content that has been provided to that Service. Also, in some of our Services, there are terms or settings that narrow the scope of our use of the content submitted in those Services. Make sure you have the necessary rights to grant us this license for any content that you submit to our Services.<br>

Our automated systems analyze your content (including emails) to provide you personally relevant product features, such as customized search results, tailored advertising, and spam and malware detection. This analysis occurs as the content is sent, received, and when it is stored.<br>

If you have a Rhythms X Account, we may display your Profile name, Profile photo, and actions you take on Rhythms X or on third-party applications connected to your Rhythms X Account (such as +1’s, reviews you write and comments you post) in our Services, including displaying in ads and other commercial contexts. We will respect the choices you make to limit sharing or visibility settings in your Rhythms X Account. For example, you can choose your settings so your name and photo do not appear in an ad.<br>

You can find more information about how Rhythms X uses and stores content in the privacy policy or additional terms for particular Services. If you submit feedback or suggestions about our Services, we may use your feedback or suggestions without obligation to you.<br>

<p style="font-size: large; font-weight: 600; padding-bottom: 0px; padding-top: 20px;">About Software in our Services</p><br>

When a Service requires or includes downloadable software, this software may update automatically on your device once a new version or feature is available. Some Services may let you adjust your automatic update settings.<br>

Rhythms X gives you a personal, worldwide, royalty-free, non-assignable and non-exclusive license to use the software provided to you by Rhythms X as part of the Services. This license is for the sole purpose of enabling you to use and enjoy the benefit of the Services as provided by Rhythms X, in the manner permitted by these terms. You may not copy, modify, distribute, sell, or lease any part of our Services or included software, nor may you reverse engineer or attempt to extract the source code of that software, unless laws prohibit those restrictions or you have our written permission.<br>

Open source software is important to us. Some software used in our Services may be offered under an open source license that we will make available to you. There may be provisions in the open source license that expressly override some of these terms.<br>
                </p>
            </div>
            <div class="modal-footer" style="padding-top: 20px">
                <button type="submit" class="btn btn-default" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
