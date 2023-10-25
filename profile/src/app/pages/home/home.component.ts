import { Component } from '@angular/core';

declare let $: any;
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styles: [
  ]
})
export class HomeComponent {


  ngOnInit (){
    $("body").attr('class', '');
    $('body').addClass('landing-pages');
    $(document).prop('title', 'Mi Servicio En linea');
    $('meta[property="og:image"]').attr('content', 'https://miservicioenlinea.com/assets/images/logo.jpeg'); 
    }

}
