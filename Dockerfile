# Sử dụng image chính thức của Cypress
FROM cypress/included:12.16.0

# Cài đặt các công cụ bổ sung nếu cần (ví dụ: Git)
USER root
RUN apt-get update && apt-get install -y git

# Thiết lập thư mục làm việc
WORKDIR /home/jenkins