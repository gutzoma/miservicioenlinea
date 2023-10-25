import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProfileService } from '../../_services/profile.service';

declare let $: any;

@Component({
  selector: 'app-profile-digital',
  templateUrl: './profile-digital.component.html',
  styles: [],
  providers: [ProfileService]

})
export class ProfileDigitalComponent {

  public generales!: any;
  public redes!: any;

  constructor(private _router:ActivatedRoute, private _profileservice: ProfileService) { }

  ngOnInit (){
this._router.params.subscribe(params => {
  this.getGenerales(params['id']);
  this.getRedes(params['id']);
});
}

getGenerales(params: any) {
  this._profileservice.getGenerales(params).subscribe(
    response => {
      if(response != 'No existen'){
        this.generales = response[0];
        $("body").attr('class', '');
        $('body').addClass('landing-pages');
        $('body').addClass(this.generales.tema);
        $('.acerca-de').html(this.generales.acerca_de);
        $('.info').html(this.generales.info);
        $(document).prop('title', this.generales.nombres + ' ' +  this.generales.paterno + ' - ' + this.generales.descripcion);
        $('meta[property="og:image"]').attr('content', 'https://miservicioenlinea.com/assets/images/avatars/' + this.generales.img); 
        setTimeout(() => {
          $('.simple-loader').removeClass('loader');
          $("html").scrollTop(0);
        }, 1500);
        
        
      }else{
        window.location.href = "/#/home";
      }
    },
    error => {
      console.log(<any>error);
    }
  );
}
getRedes(params: any) {
  this._profileservice.getRedes(params).subscribe(
    response => {
      if(response != 'No existen'){
        this.redes = response;
      }
    },
    error => {
      console.log(<any>error);
    }
  );
}
}