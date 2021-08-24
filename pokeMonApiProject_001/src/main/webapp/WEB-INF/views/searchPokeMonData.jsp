<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<style>
.search_area{
	width:1300px;
	margin: 0 auto;

}
.mid_title{
	text-align:center;
	margin-top: 40px;
	

}
.pokeMonImage{
	text-align:center;

}
.pokeName_title{
	text-align:center;
}
.location_area{
	display:flex;
}
.pokeInfo_data{
	display:flex;
	align-items:center;
	justify-content:center;

}
.p_01{
	font-weight:bold;
	font-size:20px;
	

}
.poke_evole_area{
	display:flex;
}
.parap{
	text-align:center;
}
.main_image img{
	width:20%;
}

</style>
<body>

<h1 class="mid_title"> <div class="main_image">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/500px-International_Pok%C3%A9mon_logo.svg.png">
</div>pokemon search </h1>

<div class="search_area">
<div class="input-group mb-3">
  
  <input type="text" id="pokeMonSearch" class="form-control" placeholder="pokeMonName" aria-describedby="basic-addon1">
  <button type="button" @click="search()" class="btn btn-primary">검색</button>
   <button type="button" @click="refresh()" class="btn btn-success">초기화</button>
</div>
<div id="data_Area_OB">
<h2 class="pokeName_title">  {{pokeMonName}} {{pokeId }}</h2>
<div class="pokeInfo_data">
<div class="pokeMonImage">

<img v-bind:src="official_artwork">

<div class="poke_desc">
<p class="p_01">세대 : {{generation}}</p>
<p class="p_01">기초 친밀도 : {{base_happiness}}</p>
<p class="p_01">색상 : {{color}}</p>

<p class="p_01"><input type="hidden" id="evolution_chain" v-model= "evolution_chain" ref="evolution_chain"></p>

</div>
</div>


<table class="table table-striped" id="nickname">

<tr>
<td><h2> 국가별 포켓몬 별칭 </h2></td>
</tr>
<tr>
<td> </td>

</tr>

</table>
<table class="table table-striped" id="realName">

<tr>
<td><h2> 국가별 포켓몬이름 </h2></td>
</tr>
<tr>
<td> </td>

</tr>

</table>
</div>
<h2> 진화 정보 </h2>
<div class="poke_evole_area">
	<div class="ev_01">
	<img v-bind:src="EvolveChain3"> 
	
	<p class="parap">{{beforeEvole}}</p>
	</div>
	
	
	<div class="ev_01">
	<img v-bind:src="EvolveChain2"> 
	<p class="parap"> {{nowPokeMon}} </p>
	</div>
	<div class="ev_01">
	<img v-bind:src="EvolveChain1"> 
	<p class="parap"> {{afterEvole}} </p>
	</div>



</div>
	<h2>포켓몬 정보</h2>
	<div class="table_items">
	<table class="table table-striped" id="table_pokeinfo">
      <tr>
      <td>타입</td>  
      <td>능력</td>
      <td>앞모습</td>
      <td>뒷모습</td>
      <td>키</td>
      <td>몸무게</td>
      <td>기초체력</td>
      <td>기본공격력</td>
      <td>기본방어</td>
      <td>기본특수공격력</td>
      <td>기본특수방어력</td>
      <td>기본스피드</td>
      <td>기본경험치</td>
      
      </tr>
   
      <tr>
      <td>{{pokeMonType}}</td>
      <td id="ability"> </td>
      <td><img v-bind:src="pokeMonImage"> </td>
      <td><img v-bind:src="back_default"></td>
      <td>{{height}}</td>
      <td>{{weight}}</td>
      <td>{{baseHp}}</td>
      <td>{{baseAttack}}</td>
      <td>{{baseDefence}}</td>
      <td>{{baseSpecialAttack}}</td>
      <td>{{baseSpecialDefence}}</td>
      <td>{{baseSpeed}}</td>
      <td>{{base_experience}}</td>
      </tr>
     
    
         
   </table>
   </div>
   <h2> 기술 </h2>
   <div class="moves_items">
  	<table class="table table-striped" id="moves_table">
  	<tr> 
  	<td> 기술 </td>
  	</tr>
  	<tr>
  	<td> </td> 
    </tr>
  	
  	
  	
  	</table>
   
   
   </div>
   <h2> 포켓몬 출몰지역</h2>
   <div class="location_area">
   <table class="table table-striped" id="location_area_table">
  	<tr> 
  	<td> 출몰지역 </td>
  
  	</tr>
  	<tr>
  
    </tr>
  	
  	
  	
  	</table>
  	
  	 <table class="table table-striped" id="location_version_table">
  	<tr> 
  	<td> 게임버전 </td>
  	</tr>
  	<tr>
  
    </tr>
  	
  	
  	
  	</table>
   
   
   </div>

</div>
</div>

</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
const app = new Vue({
    el: '.search_area',
    data:{
    	pokeMonName: '',
    	pokeMonType: '',
    	pokeMonImage:'',
    	height:'',
    	weight:'',
    	baseHp:'',
    	baseAttack:'',
    	baseDefence:'',
    	baseSpecialAttack:'',
    	baseSpecialDefence:'',
    	baseSpeed:'',
    	base_experience:'',
    	back_default:'',
    	official_artwork:'',
    	pokeId : '',
    	moves: '',
    	pokeMonType2:'',
    	abilities : '',
    	location_area:'',
    	base_happiness:'',
    	color:'',
    	evolution_chain:'',
    	evolves_from_species:'',
    	genera:'',
    	generation:'',
    	beforeEvole: '',
    	nowPokeMon:'',
    	afterEvole:'',
    	EvolveChain1:'',
    	EvolveChain2:'',
    	EvolveChain3:'',
   
    	
    },
    mounted(){
    	document.getElementById("data_Area_OB").style.display="none";
    	// $("#data_Area_OB").attr('style', "display:'';");
    },
    created(){
   
    	
    },
    methods: {
    	refresh(){
    		window.location.reload();
    	},
    	search(){
    		// 검색한 포켓몬의 데이터를 가져온다. 
    		
    		
    		var pokeMon = document.getElementById("pokeMonSearch").value;
    		if(pokeMon == ""){
    			alert("포켓몬을 입력해주세요!")
    			return false;
    		}
    		axios.get('/getPokeMonData',{
    	        params:{
    	        	pokeMon:pokeMon,
    	        }
    	    })
    	    .then((res)=>{
    	        //if success! //
    	     console.log(res.data);
    	     this.pokeMonType = res.data.types[0].type.name;
    	     //this.pokeMonType2 = res.data.types[1].type.name;
    	     this.pokeMonImage = res.data.sprites.front_default;
    	     this.pokeMonName = res.data.forms[0].name;
    	     this.weight = res.data.weight;
    	     this.height = res.data.height; 	 
    	     this.back_default = res.data.sprites.back_default;
    	     this.baseHp = res.data.stats[0].base_stat;
    	     this.baseAttack = res.data.stats[1].base_stat;
    	     this.baseDefence = res.data.stats[2].base_stat;
    	     this.baseSpecialAttack = res.data.stats[3].base_stat;
    	     this.baseSpecialDefence = res.data.stats[4].base_stat;
    	     this.baseSpeed = res.data.stats[5].base_stat;
    	     this.base_experience = res.data.base_experience;
    	     this.official_artwork = res.data.sprites.other["official-artwork"].front_default;
    	     this.pokeId = res.data.id;
    	     
    	     this.abilities = res.data.abilities;
    	     for(var i = 0 ; i < Object.keys(res.data.abilities).length;i++){
    	    	  this.abilities = res.data.abilities[i].ability.name;
    	    	  $('#table_pokeinfo').append('<tr><td id="ability">' + res.data.abilities[i].ability.name+'</td></tr>');
    	    	  
    	     }
    	     console.log(Object.keys(res.data.moves).length);
    	     // json object 의 객체 갯수(길이를 구하고싶을때 사용);
    	     //console.log(res.data.moves[1]['move'].name);
    	     for(var i = 0 ; i < Object.keys(res.data.moves).length; i++){
    	    	 this.moves = res.data.moves[i].move.name;
    	    	 //console.log(this.moves);
    	    	 // <td>'+res.data[i].version_details[i].version.name+'</td>
    	    	 $('#moves_table').append('<tr><td>'+res.data.moves[i].move.name+'</td></tr>');
    	     }
    	    
    	 
    	   
    	   
    	    })
    	    // 검색한 해당 포켓몬의 출몰 지역을 게임버전별로 보여준다. 
    	    axios.get('/getPokemonEncounters',{
    	        params:{
    	        	pokeMon:pokeMon,
    	        }
    	    })
    	     .then((res)=>{
    	    	console.log("포켓몬 출몰데이터 get ");
    	    	console.log(res.data);
    	    	console.log(res.data.length);
    	    	//console.log(Object.keys(res.data[i]).length);
    	    	for(var i = 0 ; i < res.data.length; i++){
    	    		this.location_area = res.data[i].location_area.name;
    	    		$('#location_area_table').append('<tr><td>' +res.data[i].location_area.name+'</td</tr> ');
    	    		 	    		
    	    	}
    	    	for( var j = 0 ; j <= res.data.length;j++){
    	    		console.log(res.data[j].version_details[0].version.name);
    	    		$('#location_version_table').append('<tr><td>' +res.data[j].version_details[0].version.name+'</td</tr> ');
    	    	}
    	    	
    	   
    	       
    	     })
    	     // 검색한 해당포켓몬의 정보를 가져온다 
    	     axios.get('/getPokemonSpecies',{
    	    	 params:{
    	    		 pokeMon:pokeMon,
    	    	 }
    	     })
    	     .then((res)=>{
    	    	 console.log("검색한 해당포켓몬의 정보를 가져옵니다. ( 진화 , 종 등의 데이터 )")
    	    	 console.log(res.data);
    	    	 this.base_happiness = res.data.base_happiness;
    	    	 this.color = res.data.color.name;
    	    	 this.evolution_chain = res.data.evolution_chain.url;
    	    	// this.evolves_from_species = res.data.evolves_from_species.name;
    	    	 for(var i = 0 ; i < Object.keys(res.data.genera).length; i++){
    	    		 console.log("포켓몬 닉네임 ")
    	    		 console.log(res.data.genera[i].genus);
    	    		 $('#nickname').append('<tr><td>' +res.data.genera[i].genus +'</td></tr>')
    	    	 }
    	    	 this.generation = res.data.generation.name;
    	    	 for(var i = 0 ; i < Object.keys(res.data.names).length; i++){
    	    		 console.log(res.data.names[i].name)
    	    		 $('#realName').append('<tr><td>' +res.data.names[i].name+'</td></tr>')
    	    	 }
    	    	 // 해당 포켓몬의 진화체인정보를 가져온다.
        	     //var evolution_chain = document.getElementById("evolution_chain").value;
        		   
        		
        	     axios.get(this.evolution_chain)
        	     .then((res)=>{
        	    	 console.log("진화체인 data get !" );
        	    	 console.log(res.data);
        	    	 
        	         //console.log(res.data.chain.species.name); // 진화 전 포켓몬 
        	         this.beforeEvole = res.data.chain.species.name;        	         
        	    	 //console.log(res.data.chain.evolves_to[0].species.name);// 현재 포켓몬 
        	    	 this.nowPokeMon = res.data.chain.evolves_to[0].species.name;
        	    	// console.log(res.data.chain.evolves_to[0].evolves_to[0].species.name);
        	    	 this.afterEvole = res.data.chain.evolves_to[0].evolves_to[0].species.name;
        	    	 // 가져온 진화 체인포켓몬의 이름을 기준으로 해당 포켓몬의이미지 데이터를 가져온다.
        	    	 //1) 진화전 포켓몬 데이터  => 3 
		        	 axios.get('/getPokeMonData',{
		    	        params:{
		    	        	pokeMon:this.beforeEvole,
		    	        }
		    	       })
		    	       .then((res)=>{
		    	    	   console.log("진화전 데이터 ");
		    	    	   console.log(res.data.sprites.other["official-artwork"].front_default);
		    	    	   this.EvolveChain3 = res.data.sprites.other["official-artwork"].front_default;
		    	       })
		    	       
		    	        //2) 진화후 포켓몬 데이터  순서 : => 1 
		        	 axios.get('/getPokeMonData',{
		    	        params:{
		    	        	pokeMon:this.afterEvole,
		    	        }
		    	       })
		    	       .then((res)=>{
		    	    	   console.log("진화후 데이터 ");
		    	    	   console.log(res.data.sprites.other["official-artwork"].front_default);
		    	    	   this.EvolveChain1 = res.data.sprites.other["official-artwork"].front_default;
		    	       })
		    	       //3) 전 3 포켓몬 데이터 순서 : => 2
		    	       
		    	        axios.get('/getPokeMonData',{
		    	        params:{
		    	        	pokeMon:this.nowPokeMon,
		    	        }
		    	       })
		    	       .then((res)=>{
		    	    	   console.log("진화후 데이터 ");
		    	    	   console.log(res.data.sprites.other["official-artwork"].front_default);
		    	    	   this.EvolveChain2 = res.data.sprites.other["official-artwork"].front_default;
		    	       })
        	    	 
        	    	 
        	     });
    	    	 
    	     })
    	    
    	     
    	    
    	     document.getElementById("data_Area_OB").style.display="block"; 
    	 
    },
    }
});




</script>
</html>