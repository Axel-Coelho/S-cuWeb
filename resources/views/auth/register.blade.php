@extends('layouts.master')

@section('content')
<br></br>
<br></br>

<!--================Login Box Area =================-->
<section class="login_box_area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login_box_img">
                    <img class="img-fluid" src="img/login.jpg" alt="">
                    <div class="hover">
                        <h4>Avez-vous un compte ?</h4>
                        <a class="primary-btn" href="{{ route('login') }}">Connexion</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login_form_inner">
                    <h3>Créer un compte !</h3>
                    <form class="row login_form" id="contactForm" novalidate="novalidate" method="POST" action="{{ route('register') }}">
                        <!-- {{ csrf_field() }} -->

                        <!-- Name -->
                        <div class="col-md-12 form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Identifiant" value="{{ old('register') }}">
                            @if ($errors->has('name'))
                            <span class="help-block">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                            @endif
                        </div>

                        <!-- Email -->
                        <div class="col-md-12 form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Votre Email" value="{{ old('email') }}">
                            @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                            @endif
                        </div>

                        <!-- Password -->
                        <div class="col-md-12 form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Mot de passe" value="{{ old('password') }}">
                            @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                            @endif
                        </div>

                        <!-- PasswordConfirmation -->
                        <div class="col-md-12 form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Confirmer votre mot de passe" value="{{ old('password_confirmation') }}">
                        </div>

                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="primary-btn">Enregistrer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Login Box Area =================-->

@endsection