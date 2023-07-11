int main(void) {
    rawsock = socket(AF_INET, SOCK_RAW, protocol->p_proto);
    if(rawsock < 0){
        perror("socket");
        return -1;
    }
}
