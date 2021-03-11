<template>
  <div class="container mx-auto px-4 h-full flex items-center justify-center ">
    <div
      v-if="!loading"
      class="grid grid-cols-1 border rounded-lg px-4 py-5 sm:px-16 shadow-2xl w-full md:w-3/4 lg:w-3/6 bg-white"
    >
      <div v-if="!image">
        <h1 class="text-center text-2xl font-medium">Sube tu imagen</h1>

        <div
          v-if="error"
          class="font-medium text-white text-center my-2 py-5 px-2 bg-red-500 rounded-md flex items-center justify-center"
        >
          <svg class="h-8 w-8 fill-current text-white" viewBox="0 0 20 20">
            <path
              d="M10.185,1.417c-4.741,0-8.583,3.842-8.583,8.583c0,4.74,3.842,8.582,8.583,8.582S18.768,14.74,18.768,10C18.768,5.259,14.926,1.417,10.185,1.417 M10.185,17.68c-4.235,0-7.679-3.445-7.679-7.68c0-4.235,3.444-7.679,7.679-7.679S17.864,5.765,17.864,10C17.864,14.234,14.42,17.68,10.185,17.68 M10.824,10l2.842-2.844c0.178-0.176,0.178-0.46,0-0.637c-0.177-0.178-0.461-0.178-0.637,0l-2.844,2.841L7.341,6.52c-0.176-0.178-0.46-0.178-0.637,0c-0.178,0.176-0.178,0.461,0,0.637L9.546,10l-2.841,2.844c-0.178,0.176-0.178,0.461,0,0.637c0.178,0.178,0.459,0.178,0.637,0l2.844-2.841l2.844,2.841c0.178,0.178,0.459,0.178,0.637,0c0.178-0.176,0.178-0.461,0-0.637L10.824,10z"
            ></path>
          </svg>
          <p class="ml-2">
            Solo se permiten subir imagenes
          </p>
        </div>

        <div
          class="border rounded-lg border-teal-600 border-dashed py-10 px-6 sm:px-20 bg-teal-100 hover:bg-blue-100 my-5 cursor-pointer"
          @click="openFile"
          @drop.prevent="addImage"
          @dragover.prevent
        >
          <div class="flex flex-col items-center">
            <svg
              class="h-12 w-12 fill-current text-teal-600"
              viewBox="0 0 20 20"
            >
              <path
                d="M4.317,16.411c-1.423-1.423-1.423-3.737,0-5.16l8.075-7.984c0.994-0.996,2.613-0.996,3.611,0.001C17,4.264,17,5.884,16.004,6.88l-8.075,7.984c-0.568,0.568-1.493,0.569-2.063-0.001c-0.569-0.569-0.569-1.495,0-2.064L9.93,8.828c0.145-0.141,0.376-0.139,0.517,0.005c0.141,0.144,0.139,0.375-0.006,0.516l-4.062,3.968c-0.282,0.282-0.282,0.745,0.003,1.03c0.285,0.284,0.747,0.284,1.032,0l8.074-7.985c0.711-0.71,0.711-1.868-0.002-2.579c-0.711-0.712-1.867-0.712-2.58,0l-8.074,7.984c-1.137,1.137-1.137,2.988,0.001,4.127c1.14,1.14,2.989,1.14,4.129,0l6.989-6.896c0.143-0.142,0.375-0.14,0.516,0.003c0.143,0.143,0.141,0.374-0.002,0.516l-6.988,6.895C8.054,17.836,5.743,17.836,4.317,16.411"
              ></path>
            </svg>

            <p class="text-gray-500 text-sm sm:text-md">
              Arrastra y suelta tu imagen aqui
            </p>
          </div>
        </div>

        <h1 class="text-center mb-4">O</h1>

        <div class="flex justify-center">
          <input
            type="file"
            ref="file"
            accept="image/*"
            @change="changeFile"
            v-show="true == false"
          />

          <button
            @click="openFile"
            class="bg-teal-500 hover:bg-teal-600 text-white font-medium border rounded-md py-2 px-4"
          >
            Elige tu imagen
          </button>
        </div>
      </div>

      <div v-else>
        <div class="flex justify-center">
          <svg class="h-12 w-12 fill-current text-teal-600" viewBox="0 0 20 20">
            <path
              d="M10.219,1.688c-4.471,0-8.094,3.623-8.094,8.094s3.623,8.094,8.094,8.094s8.094-3.623,8.094-8.094S14.689,1.688,10.219,1.688 M10.219,17.022c-3.994,0-7.242-3.247-7.242-7.241c0-3.994,3.248-7.242,7.242-7.242c3.994,0,7.241,3.248,7.241,7.242C17.46,13.775,14.213,17.022,10.219,17.022 M15.099,7.03c-0.167-0.167-0.438-0.167-0.604,0.002L9.062,12.48l-2.269-2.277c-0.166-0.167-0.437-0.167-0.603,0c-0.166,0.166-0.168,0.437-0.002,0.603l2.573,2.578c0.079,0.08,0.188,0.125,0.3,0.125s0.222-0.045,0.303-0.125l5.736-5.751C15.268,7.466,15.265,7.196,15.099,7.03"
            ></path>
          </svg>
        </div>

        <h1 class="text-center text-lg font-medium">
          Subida correctamente
        </h1>

        <div class="bg-gray-300 rounded-md">
          <img class="object-contain h-56 w-full rounded-md" :src="image.url" />
        </div>

        <div class="flex flex-row items-center pt-4">
          <p class="truncate py-2 bg-gray-300 rounded-l-md pl-3">
            {{ image.url }}
          </p>
          <button
            @click="copyLink"
            class="bg-teal-500 hover:bg-teal-600 text-white font-medium border rounded-r-md py-2 px-4"
          >
            Copiar
          </button>
        </div>

        <div class="flex justify-center">
          <button
            @click="uploadOtherImage"
            class="bg-white border-teal-500 text-teal-500 hover:text-white hover:bg-teal-500 font-medium border rounded-md py-2 px-4 mt-1"
          >
            Subir otra imagen
          </button>
        </div>

        <div v-if="copy" class="flex justify-center flex-row mt-2">
          <div
            class="bg-green-500 text-white w-1/2 rounded-md flex justify-center items-center py-1"
          >
            <svg class="h-8 w-8 fill-current" viewBox="0 0 20 20">
              <path
                d="M10.219,1.688c-4.471,0-8.094,3.623-8.094,8.094s3.623,8.094,8.094,8.094s8.094-3.623,8.094-8.094S14.689,1.688,10.219,1.688 M10.219,17.022c-3.994,0-7.242-3.247-7.242-7.241c0-3.994,3.248-7.242,7.242-7.242c3.994,0,7.241,3.248,7.241,7.242C17.46,13.775,14.213,17.022,10.219,17.022 M15.099,7.03c-0.167-0.167-0.438-0.167-0.604,0.002L9.062,12.48l-2.269-2.277c-0.166-0.167-0.437-0.167-0.603,0c-0.166,0.166-0.168,0.437-0.002,0.603l2.573,2.578c0.079,0.08,0.188,0.125,0.3,0.125s0.222-0.045,0.303-0.125l5.736-5.751C15.268,7.466,15.265,7.196,15.099,7.03"
              ></path>
            </svg>
            <p class="pl-1">Copiado</p>
          </div>
        </div>
      </div>
    </div>

    <div
      v-else
      class="border rounded-lg py-4 flex flex-col justify-center shadow-lg bg-white"
    >
      <p class="mx-12">Cargando...</p>
      <div class="px-3">
        <div class="progress-line bg-teal-300"></div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

const URL_API = process.env.VUE_APP_URL_API ?? 'http://localhost:8000/api'

export default {
  name: 'Home',
  data: () => {
    return {
      file: null,
      // url: null,
      error: false,
      loading: false,
      image: null,
      copy: false
    }
  },
  mounted() {
    console.log(process.env.VUE_APP_URL_API)
  },
  watch: {
    file(value) {
      if (value) {
        this.uploadFile(value)
      }
    }
  },
  methods: {
    openFile() {
      this.$refs.file.click()
    },
    addImage(e) {
      let droppedFiles = e.dataTransfer.files
      if (!droppedFiles) return

      this.setImage(droppedFiles[0])
    },
    changeFile(e) {
      if (!e.target.files.length) return

      this.setImage(e.target.files[0])
    },
    setImage(file) {
      if (file.type.indexOf('image/') >= 0) {
        this.error = false
        this.file = file

        // this.readUrlFromFile(this.file)
      } else {
        this.file = null
        this.error = true
      }
    },
    uploadFile(file) {
      this.loading = true

      let form = new FormData()

      form.append('url', file)

      axios.post(URL_API + '/images/', form).then(response => {
        this.image = response.data
        this.loading = false
      })
    },
    copyLink() {
      navigator.clipboard.writeText(this.image.url).then(() => {
        this.copy = true
      })
    },
    uploadOtherImage() {
      this.image = null
      this.file = null
    }
    /* readUrlFromFile(file) {
      const vm = this
      let reader = new FileReader()
      reader.onload = f => {
        // f.target.result contains the base64 encoding of the image
        vm.url = f.target.result
      }
      reader.readAsDataURL(file)
    } */
  }
}
</script>

<style>
.progress-line,
.progress-line:before {
  height: 3px;
  width: 100%;
  margin: 0;
}
.progress-line {
  display: -webkit-flex;
  display: flex;
}
.progress-line:before {
  background-color: theme('colors.teal.500');
  content: '';
  -webkit-animation: running-progress 2s cubic-bezier(0.4, 0, 0.2, 1) infinite;
  animation: running-progress 2s cubic-bezier(0.4, 0, 0.2, 1) infinite;
}
@-webkit-keyframes running-progress {
  0% {
    margin-left: 0px;
    margin-right: 100%;
  }
  50% {
    margin-left: 25%;
    margin-right: 0%;
  }
  100% {
    margin-left: 100%;
    margin-right: 0;
  }
}
@keyframes running-progress {
  0% {
    margin-left: 0px;
    margin-right: 100%;
  }
  50% {
    margin-left: 25%;
    margin-right: 0%;
  }
  100% {
    margin-left: 100%;
    margin-right: 0;
  }
}
</style>
