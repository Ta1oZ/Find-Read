<script setup>
import navcomp from '../components/navbar.vue'
import axios from '@/plugins/axios';
</script>

<template>
  <div id="app">
    <navcomp></navcomp>
    <h1 class="text-5xl text-center text-black underline underline-offset-8 my-8"><b>Categories</b></h1><br><br>
    <div class="fixse flex w-full justify-end">
      <label for="cate" class="text-xl"><b>หมวดหนังสือ: </b></label>
      <select class="border-2 border-black rounded-sm mx-4" name="book_type" v-model="book_type" @change="filterBooks">
        <option selected></option>
        <option>howto</option>
        <option>literature</option>
        <option>business</option>
        <option>garden</option>
        <option>novel</option>
      </select>
    </div><br><br>

    <section class="w-full h-auto flex justify-center">
      <div class="grid grid-cols-5 gap-x-12 gap-y-14">
        <div v-for="items in filteredItems" class="h-full w-48 mr-6 bg-white shadow-md rounded-lg overflow-hidden">
          <div class="top flex justify-center w-full h-48">
            <img class="h-full object-cover" :src="getimg(items.book_img)" alt="Book cover">
          </div>
          <div class="content px-4 py-2">
            <p class="text-lg text-gray-800 overflow-hidden h-[3rem] truncate ">{{ items.book_name }}</p>
            <p class="text-sm text-gray-600 truncate">แนว: {{ items.book_type }}</p>
            <p class="text-sm text-gray-600 truncate">ผู้เขียน: {{ items.author }}</p>
            <p class="text-sm text-gray-600 truncate">สํานักพิมพ์: {{ items.publisher }}</p>
          </div>
          <router-link :to="{ name: 'books', params: { id: items.book_id } }">
            <button
              class="w-full bg-zinc-700 hover:bg-zinc-800 text-white font-semibold py-2 px-4 rounded-b-lg focus:outline-none focus:shadow-outline">
              อ่านเพิ่มเติม
            </button>
          </router-link>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  props: ['user'],
  data() {
    return {
      items: [],
      book_type: ''
    }
  },
  mounted() {
    this.getbooks();
  },
  computed: {
    filteredItems() {
      if (!this.book_type) {
        return this.items; // If no book type selected, return all items
      } else {
        return this.items.filter(item => item.book_type === this.book_type); // Filter items based on selected book type
      }
    }
  },
  methods: {
    getbooks() {
      axios
        .get("/books", {
        })
        .then((response) => {
          this.items = response.data.books;
          console.log(this.items)
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getimg(img) {
        console.log(baseURL)
      return  baseURL + img;
    },
    createwish(seen) {
      console.log(seen)
      axios.post("/wishlist", { sent: seen })
        .then((response) => {
          console.log(response)
          this.$router.push({ path: '/wishlist' })
        })
        .catch((err) => {
          console.log(err);
        });
    }
  }
}

</script>

<style></style>