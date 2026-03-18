# Fail Name ==Dockerfile==
FROM ghcr.io/bluesky-social/pds:latest

# --- إعدادات البيئة لـ Render ---
# Render يستخدم المنفذ 10000 افتراضياً للخدمات المجانية
ENV PDS_HOSTNAME="your-app-name.onrender.com" 
ENV PDS_PORT=10000
ENV PDS_DATA_DIRECTORY="/data"
ENV PDS_BLOBSTORE_DISK_LOCATION="/data/blobs"
ENV PDS_DID_PLC_URL="https://plc.directory"

# --- مفاتيح التشفير ---
ENV PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX="a5c546462700313364f71a0753069153303666f7f3f26017f86450f383e36125"
ENV PDS_REPO_SIGNING_KEY_K256_PRIVATE_KEY_HEX="77964b73248316e6896266396e9533f82087612f0e6e730030010b3735165153"
ENV PDS_JWT_SECRET="df9823hfsd923hfsd923hf9sdhf9sdhf9sd23hf9sdh"
ENV PDS_ADMIN_PASSWORD="admin_password_ali_525"

# --- إعدادات فتح السيرفر ---
ENV PDS_INVITE_REQUIRED=false
ENV PDS_ALLOW_PRIVILEGED_CREATION=true

# --- إعدادات المجلدات ---
USER root
RUN mkdir -p /data/blobs && chmod -R 777 /data

# Render يراقب هذا المنفذ
EXPOSE 10000

# تشغيل الـ PDS مباشرة
CMD ["node", "index.js"]
