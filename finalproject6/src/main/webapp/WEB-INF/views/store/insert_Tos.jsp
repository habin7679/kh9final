<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VueJS</title>

    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/cosmo/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>

    </style>
</head>
<body>
    <!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container-fluid">
        
        <div class="row mt-4 p-2">
            <div class="col-md-8 offset-md-2 p-4 text-light bg-dark rounded">
                <h1>결제 서비스 이용약관</h1>
                <p>
                    이용약관에 동의하셔야 서비스를 이용하실 수 있습니다.
                </p>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8 offset-md-2">
                <label class="form-label">이용약관1</label>
                <textarea class="form-control rounded" rows="5" readonly>{{agree1Text}}</textarea>
                <label class="mt-2">
                    <input type="checkbox" v-model="agree1">
                    <span class="ms-2">동의합니다</span>
                </label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8 offset-md-2">
                <label class="form-label">이용약관2</label>
                <textarea class="form-control rounded" rows="5" readonly>{{agree2Text}}</textarea>
                <label class="mt-2">
                    <input type="checkbox" v-model="agree2">
                    <span class="ms-2">동의합니다</span>
                </label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8 offset-md-2">
                <label class="form-label">이용약관3</label>
                <textarea class="form-control rounded" rows="5" readonly>{{agree3Text}}</textarea>
                <label class="mt-2">
                    <input type="checkbox" v-model="agree3">
                    <span class="ms-2">동의합니다</span>
                </label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8 offset-md-2 d-grid">
                <button onclick="location.href='insert';" class="btn btn-primary rounded" v-bind:disabled="agreeAll == false">다음 단계로 이동</button>
            </div>
        </div>
        <div class="mt-5 mb-5"></div>

    </div>

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    agree1Text:"예약할꺼니깐 동의해주세요",
                    agree2Text:"지도쓸꺼니깐 동의해주세요",
                    agree3Text:"개인정보 동의해주세요",
                    agree1:false,//첫 번째 이용약관 동의여부
                    agree2:false,//두 번째 이용약관 동의여부
                    agree3:false,//세 번째 이용약관 동의여부
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                agreeAll(){
                    return this.agree1 && this.agree2 && this.agree3;
                },
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
            },
        });
        app.mount("#app");
    </script>
</body>
</html>