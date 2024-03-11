<script setup>
import { RouterLink, RouterView } from 'vue-router'
import axios from '@/plugins/axios'

</script>

<template>
  <router-view :key="$route.fullPath" @auth-change="onAuthChange" :user="user" />
</template>

<script>
export default {
    data() {
        return {
            user: null
        }
    },
    async mounted () {
        await this.onAuthChange()
    },
    methods: {
        async onAuthChange () {
            const token = localStorage.getItem('token')
            if (token) {
                await this.getUser()
            }
        },
        async getUser () {
            try {
                const response = await axios.get('/user/me')
                this.user = response.data
            } catch (error) {
                console.error('Error fetching user:', error)
                // Handle the error, e.g., display an error message
            }
        },
    }
}
</script>
