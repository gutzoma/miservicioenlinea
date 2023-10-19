import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Global } from './global';


@Injectable()
export class ProfileService{
	public url:string;

	constructor(
		private _http: HttpClient
	){
		this.url = Global.url;
	}

    getGenerales(id: string): Observable<any>{
		let headers = new HttpHeaders().set('Content-Type', 'application/json');

		return this._http.get(this.url+'generales/'+id, {headers: headers});
	}
	getRedes(id: number): Observable<any>{
		let headers = new HttpHeaders().set('Content-Type','application/json');

		return this._http.get(this.url+'redes/'+id, {headers: headers});
	}

	// getProjects(): Observable<any>{
	// 	let headers = new HttpHeaders().set('Content-Type', 'application/json');

	// 	return this._http.get(this.url+'projects', {headers: headers});
	// }

	// getProject(id): Observable<any>{
	// 	let headers = new HttpHeaders().set('Content-Type', 'application/json');

	// 	return this._http.get(this.url+'project/'+id, {headers: headers});
	// }

	// deleteProject(id): Observable<any>{
	// 	let headers = new HttpHeaders().set('Content-Type', 'application/json');

	// 	return this._http.delete(this.url+'project/'+id, {headers: headers});
	// }

	// updateProject(project): Observable<any>{
	// 	let params = JSON.stringify(project);
	// 	let headers = new HttpHeaders().set('Content-Type', 'application/json');

	// 	return this._http.put(this.url+'project/'+project._id, params, {headers: headers});
	// }

}