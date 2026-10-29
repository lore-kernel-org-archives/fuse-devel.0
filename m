Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270360;
	b=u0dXPFrEoVDB5p0mC01+scIeCt7YqVNr2/SpuM3wSyVfVIFB9KinpgUMFyhAgeWhnDBC
	 qM81zS0KbyFFxGXHAh3atfLxe4ZthcrkoTyFVbcNfEa3kzn3C4RHpnUzr9s4gUGts5On/
	 FBZCTbFV7fD1MKdYFnpcMPNUG5B4Muh5/hLDjAa8LEFvv2iHzvzJu27GuA25zJ+5pyxct
	 CqF1T7lK1joTTC6Cp7Iz3FjcjrAVpOfDosIu6buihLsUfmCc2lAOJMWdW63ph/25ULfx+
	 fk9Lr61Dx6jfD8kH/ZeHic5dSfwUoUYfitIJpc7zSIIrBArHBnDXZ8GjWrZvzN/1Dkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8cu0Twbd3w2gzcJmrd4ZCL+JhFNI2Ni02bPrZLMEiF0=;
	b=WHKh0woGbpU3oATeQeARtKsKbhRXiI4vC8v0FfpkjZhZnT1xdICPwUWCtJgjL+sgIaZV
	 V//GDVuhjqkm3hDyD9XIvkRMNcvL1lutEggRZsdVFWGNpk+8CtDt1/VE5SE/2JAM+5BW2
	 v2ykNi6QBbM4SMvHQb8Qhse7/I8stI11Xg2/7hvf1CevVVZOOc7YaklNeRnetag7vtt2i
	 YG1diBHXMyenbaymEKrM5++S8UtUNQypG6Zc2BkLQ/VrjGmA5P2836vN1fM8WmfebZQfd
	 TJUoTOqTQ9iI6NanGw6wPNvBWyqZtpJv6pVFIG6m6jFKuTPLYKloym/bGyPxhJY3h9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lanLiQdg;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388360A2606
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F388360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lanLiQdg
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so303952966b.3
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270358; x=1793875158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cu0Twbd3w2gzcJmrd4ZCL+JhFNI2Ni02bPrZLMEiF0=;
        b=lanLiQdgKZKI+vYnegEBz1GIp09JhuFMLN07qaOf3sJ/me7DYZU14W0BhU3QnV19dT
         zw+b2x8sArPPByw0O/RFFMXM4BFYp1IIWMzTJorPs/9UP85Vr635O2bSrPZt0IkA5wzT
         BZFYmObUIs8ttHHy5VxD0sxPrRAZI1yPZTWSHzqgSmzCq1OT0o1wFIDrXux3ysTxMleW
         WFvWZ0us+V96oWlHXImDHGej1EYd+qN6O2h1ey4LMbZCjrez9EX06VamdpzyoKQSVTVy
         TdVTNluIzz7+dNgo7fO2ZyPKfqeFrL1rvpK7sum5xmN5yIlmO/vonkv61pCqwHoBLu4T
         1EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270358; x=1793875158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cu0Twbd3w2gzcJmrd4ZCL+JhFNI2Ni02bPrZLMEiF0=;
        b=viVvkfTYCOORvg7jTjvw+MDRlCyy9Pg3zrlCBDZM/plJVn3WZ//ik15nfLhjhmQ5dZ
         bkmkYdN1k/eUpxg6QEKR9BaM0XXP5/uOg0yrzuy+jn8HwWRH7E/c91IyWYTOKvFUJ2l+
         OV+to7OWkPCzUU6yIypmcE5rNATdJDBmo9Sh83lfCL9YUHjwr1PYNde+vwpGnSLIUzw8
         OyefKl3wXfNwiymcLtdqdx1NRw3PCZoxWi7easnzYE5aMABHfe0eSNGRGNuGOOymjug0
         Y6HQ6L6QDvw0az+2a8+YSbEOIbnEtKVlukmxSzrIFXpnUPZait3OCmuzltX8VRRHZaij
         lYqA==
X-Forwarded-Encrypted: i=1; AKwUvBzdbN2atLR8U7oBMve/0hpIfuWn5C1/QfugnJgpqRmq/Ua89JYWmZnvPumF8fWhKPdkmCCDPAIRG0Eq@lists.linux.dev
X-Gm-Message-State: AFq9FYIoLcjqM7JtsrTszEhAq0LmiotTgPS5OEegtAde3AYQUiuJYBUs
	HvQSSICieis1kw9OXgOYccNdjSS9BRj+fs7UckyoUvLVXvaAheU57IFX
X-Gm-Gg: AYBFou2BO4HnpRwyxAZVM1JPUp3Jz+0XG2NUK4cgPVM5cjJxennQTK6dgXXXs6HoT1I
	H9jbytVTmb8sBo7/EWiCVOMwYm9hI700MjyzlRb5wblDNmIawXAK0ICvMyxAH8GEdx1/UCPHGOa
	LH5eiVh1YVvlRZ6u6ycV4vWtnoUP/da3sU9zePNRnT97U8M0PluXt6uYibRmEE11ryM3aYVja9O
	vH/py9TLNTTDiGn5SajMBtGZcTpF9B1xb5mNzXJwSpeYtrVgejO/qDenD+kg6tm1bg0KjzJFZ7U
	HCevikDoHYJeUecYYqmDLrfybWaLGmmJVYChBTi3KGrjJWsDHsS68xv4UW9mul7zhRpoCynlZo1
	b+4uEimYQmQGCiBwurmpAC7fPSDHj4qoRkBjE+PCGFGJLDluiKnALAjKfdDJlWmewLhoSlS0zFf
	pwcRu+mVFOZdhMK/E9oHWSj0TSivTFKIt8/3oi/gTO8m2FhpeivkvdjrUpC68TAeIXexMCIWcMV
	eiTH8U5eYyGb50GjRNWGpWTKJWD2jCtuumjvQH7xtS5k4k67jsh827XszER583/RE8fwtFyueWD
	peXcWGgAyx11JPhAtjQg8KRN1Na5lxQt3X9tDlttNrrFFGSuGviLrNMzFxkU8MdA3kcXa2q756Z
	yGvD6yS8D0SxO8+LTHmDxbvElgk40GDL9tg==
X-Received: by 2002:a17:907:962a:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c49bdf43b4bmr451277766b.20.1793270358157;
        Thu, 29 Oct 2026 03:39:18 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fa1asm719578366b.6.2026.10.29.03.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:17 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Fahad Alharbi <fahad@codepure.com>,
	stable@vger.kernel.org
Subject: [PATCH 02/16] ovl: fortify ovl_copy_xattr() against underlying layer modifications
Date: Thu, 29 Oct 2026 11:39:06 +0100
Message-ID: <20261029103913.2785828-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
References: <20261029103913.2785828-1-amir73il@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adapt ovl_getxattr_value() to be used from ovl_copy_xattr(), by
allowing to pass it a pre-allocated buffer, which can be resized
and by handling the ENODATA/EOPNOTSUPP return codes in the caller.

This replaces the retry loop in ovl_copy_xattr() with a single retry
after resizing the buffer. If the value changed again by then, the
underlying layer was modified, so return -EIO instead of retrying.

As a side effect, ovl_copy_up_meta_inode_data() now returns -EIO instead
of -ERANGE in this case of underlying xattr size changes.

Reported-by: Fahad Alharbi <fahad@codepure.com>
Tested-by: Fahad Alharbi <fahad@codepure.com>
Suggested-by: Miklos Szeredi <miklos@szeredi.hu>
Link: https://lore.kernel.org/linux-fsdevel/CAJfpegsVoUyqy0dYkTvBGRZvgdv_nmzmCw_uF+LP-Vq3EhEkSg@mail.gmail.com/
Fixes: e4ad29fa0d22 ("ovl: use a minimal buffer in ovl_copy_xattr")
Cc: stable@vger.kernel.org
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/copy_up.c | 68 ++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index c220cb5d0b70c..eee22581b14f1 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -72,6 +72,9 @@ static int ovl_copy_acl(struct ovl_fs *ofs, const struct path *path,
 	return err;
 }
 
+static ssize_t ovl_getxattr_value(const struct path *path, char *name,
+				  char **value, ssize_t *value_size);
+
 int ovl_copy_xattr(struct super_block *sb, const struct path *oldpath, struct dentry *new)
 {
 	struct dentry *old = oldpath->dentry;
@@ -129,34 +132,12 @@ int ovl_copy_xattr(struct super_block *sb, const struct path *oldpath, struct de
 			break;
 		}
 
-retry:
-		size = ovl_do_getxattr(oldpath, name, value, value_size);
-		if (size == -ERANGE) {
-			size = ovl_do_getxattr(oldpath, name, NULL, 0);
-			/* Nothing was read into value, so it must not be used */
-			if (size >= 0 && size <= value_size)
-				size = -EIO;
-		}
-
+		size = ovl_getxattr_value(oldpath, name, &value, &value_size);
 		if (size < 0) {
 			error = size;
 			break;
 		}
 
-		if (size > value_size) {
-			void *new;
-
-			new = kvmalloc(size, GFP_KERNEL);
-			if (!new) {
-				error = -ENOMEM;
-				break;
-			}
-			kvfree(value);
-			value = new;
-			value_size = size;
-			goto retry;
-		}
-
 		error = ovl_do_setxattr(OVL_FS(sb), new, name, value, size, 0);
 		if (error) {
 			if (error != -EOPNOTSUPP || ovl_must_copy_xattr(name))
@@ -1059,26 +1040,39 @@ static bool ovl_need_meta_copy_up(struct dentry *dentry, umode_t mode,
 	return true;
 }
 
-static ssize_t ovl_getxattr_value(const struct path *path, char *name, char **value)
+static ssize_t ovl_getxattr_value(const struct path *path, char *name,
+				  char **value, ssize_t *value_size)
 {
 	ssize_t res;
 	char *buf;
 
-	res = ovl_do_getxattr(path, name, NULL, 0);
-	if (res == -ENODATA || res == -EOPNOTSUPP)
-		res = 0;
+	res = ovl_do_getxattr(path, name, *value, *value_size);
+	if (res == -ERANGE) {
+		res = ovl_do_getxattr(path, name, NULL, 0);
+		/* Xattr changed underneath us? */
+		if (res >= 0 && res <= *value_size)
+			return -EIO;
+	}
 
-	if (res > 0) {
-		buf = kzalloc(res, GFP_KERNEL);
+	if (res > *value_size) {
+		buf = kvmalloc(res, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 
 		res = ovl_do_getxattr(path, name, buf, res);
-		if (res < 0)
-			kfree(buf);
-		else
-			*value = buf;
+		if (res < 0) {
+			kvfree(buf);
+			/* Xattr changed underneath us? */
+			if (res == -ERANGE)
+				return -EIO;
+			return res;
+		}
+
+		kvfree(*value);
+		*value = buf;
+		*value_size = res;
 	}
+
 	return res;
 }
 
@@ -1089,7 +1083,7 @@ static int ovl_copy_up_meta_inode_data(struct ovl_copy_up_ctx *c)
 	struct path upperpath;
 	int err;
 	char *capability = NULL;
-	ssize_t cap_size;
+	ssize_t cap_size = 0;
 
 	ovl_path_upper(c->dentry, &upperpath);
 	if (WARN_ON(upperpath.dentry == NULL))
@@ -1097,7 +1091,9 @@ static int ovl_copy_up_meta_inode_data(struct ovl_copy_up_ctx *c)
 
 	if (c->stat.size) {
 		err = cap_size = ovl_getxattr_value(&upperpath, XATTR_NAME_CAPS,
-						    &capability);
+						    &capability, &cap_size);
+		if (cap_size == -ENODATA || cap_size == -EOPNOTSUPP)
+			cap_size = 0;
 		if (cap_size < 0)
 			goto out;
 	}
@@ -1127,7 +1123,7 @@ static int ovl_copy_up_meta_inode_data(struct ovl_copy_up_ctx *c)
 	ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
 	ovl_set_upperdata(d_inode(c->dentry));
 out_free:
-	kfree(capability);
+	kvfree(capability);
 out:
 	return err;
 }
-- 
2.55.0

