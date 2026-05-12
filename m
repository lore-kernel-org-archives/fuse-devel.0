Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57168495506
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574911; cv=pass; b=SVlE+lOQ5PLoDq6iqbntGZ1JfwHasnigdKhtD/076i/s94q+zC6YsgW5RCjX7myfC4JdUHhpZ2ypHywyeuFwfsZxBSQ00T0vxBYZw3ujkIZ2aspNCbtBTfvLoGZn4dQbjX6sGQ4roc8rv4qY5yhyd15kheXa5v6AWHMrqG+PT6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574911; c=relaxed/simple;
	bh=/3s0/mDXbWzhJFL7MoH4SOEmubiVDCgZVTWlu9ZhNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENjk6+DnYmgd1/+VDwD2EPMpQcby8JYZgT+8tIyXAC4ARKGZDfbX6dL44mXDZR183kxDxQrwNbA1VfmYHIjMslsR12tIFvsjSQpuHm8+/OoskhJAvhHhtTP+RfuBWhtP59rrdbzS7aUUeCUr3UAyPSWy7cQnXi9tfDPsaBRuIKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=G9cnVp4h; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="G9cnVp4h"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d6ab4476eso50312201cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 01:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778574909; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxAyz79V/Uw0d6mR35ZYwCaGiW09c5nRrKzHY9mtzDYgJucO3X6wQp8QaP579wFRsB
         d9JQsQQj3pXX/tqMPUlnLvTqY45e8uLG5h9LsoxT9xfwPccJw34ms2xCfd+2NSIt3z2w
         cU5IR8pVf4gzjWcq7ac8PLjrqbxW/pY0mj4ocaKYSzpB13Zd2sXG1MmsIzcPHA+IuTlx
         1KVLIUkbmzWo0WcRMIV6w5hgQzr1Sdi9T+nXyRaYXNNKVF6zoEP+D7z01dVLHBxIux36
         PK8t7eGBM4aiDw1Kb0QRdKv0IMNIKUwzL2xOcRRL+AkECtBT8Ox8+ci4wk0qT+v4uDe8
         p50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q04gWJ+CUF2CAh1IlYHnpweBjQkfKkODdF6dN1ETVic=;
        fh=XWq/15Wuu+BukNl6yRo+ypFURc3FV/1rkQSgKESDJ/I=;
        b=R7b1HpJgM/rJ47qVl3PnH+MgpM0rd8B7DGVBZj4O6uXajWSKxRFtHH3liYeViKNyqh
         +nAHiCdHM6toa2mNvXoGc7N202aPfmZhwrKG8DU3nge+yVM246Q5qk6iiTsx5NoACac8
         /Q6FeikRMOUpVkcrQyNHpA3oyjaMeZ0KZaWHZLYk1rvFCychD9KxQsVno/Ec2/m/5hc3
         EvbPsEo1jEHlpIPYSK8K43Jti+lfj9iJk7pKmN5Kp0HIsVZ3Dx+XTkdYzk9k4Ew/J20q
         uY2haMn6jMqvgmuqpZqMAeext2IAhs1D23kwtKQZwTb1fZeFePqBQpoUCEZwj48u0h5K
         nMFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778574909; x=1779179709; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q04gWJ+CUF2CAh1IlYHnpweBjQkfKkODdF6dN1ETVic=;
        b=G9cnVp4h1HZLnQr28+k9qdiG43zisEWFBsw46Qpb/aTqzY8LTbiK1h1JTXPcMXVeMQ
         P/I6D+nIl2lad7fbmVnIJWhXXr+vvYZK1Xt+XBFggD7jtiuPMKl3TlA3LHB8ftg8+WsJ
         E8A1ZnMQw0fTr3J4qLV3Qz0M9QwOzJVzuRzLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574909; x=1779179709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q04gWJ+CUF2CAh1IlYHnpweBjQkfKkODdF6dN1ETVic=;
        b=RbBhhs681mETD6KgzbTRNvGO5k9y1i/o2gOw5og58ZgzNbJHwNLIlPtZVjQOh9jbT7
         huK0Y/zDVLWhgNwlsHpXacpliLr/beWfGqeQg6L6m4eg+NDjLxZ2EnU1HsFJdbW16g9x
         Huj4+y3f66/7w7Jph5bFtezBvGCcDiVGgnw5bOAQAw8Vxya6jNg2xnVfusbqTKzDIsbR
         VorDG1UQpA9qcfX6k9OWOjUZNjEz/wjZE0Jz/mfxUVvP4r+O8x863EzRacHRZ4EwZ1fc
         Qt9XLsabz8OiyuDQyIP+pIj1Ic/kFAKfYB7xE87vOlXscc5c4Aq8DnQq/paty03iDWtB
         tf2A==
X-Forwarded-Encrypted: i=1; AFNElJ/YygLQVk2MEiP58IZRQhhhnYWrhhvTqLQdiedXDIoGOm8r3/En2+/+8PeQJczasc03wyl/la7KX9z8@lists.linux.dev
X-Gm-Message-State: AOJu0YxGMKF5nsz41UnCQxJI/JHEFVY+/ic95bOKS3bcNtpvXbXNNdC0
	4z77gM7YdV1hrn51+LpKMbHgwQjQtouSqhZIdP80riL7FVTUC9Qr1ulFNdbwxeup0zCr0/gSHFp
	j10GJDYGlZFpylhCubIGYipDYQi7SZrZH5ZJEeh84f0BgaPIFHfkgB3g=
X-Gm-Gg: Acq92OHYa/SWFjRoxMBrckDcgPPu2tBpVfWsz4MQF/1Itw42JUqYf594+w/vZzR5k8F
	B9eR7vaKPFphWNiWW2VppwjR2WxcTbpdzs19ULUvbkq+JbrvxCVAQIY8R5Im/RhLzbZkDwdBEZU
	QOLRXO1YENK1h9b7xZ1Riu0LFeLAPzi6LRJBna5nATs8gXrHcAFLgjFb5Dyj3UaP5zAo1pd1m/C
	BpQ6oatn466nlD7OcEuMdNcOHmRlParbaph7+dPuEZSCvi6CN94oA8lPWlhhdnSX1NKwat6B4q8
	dVN5HP+lVDKS3xDOpC2Fmm/XftDhXFs+bjDre5E=
X-Received: by 2002:a05:622a:4ce:b0:50e:ca38:e219 with SMTP id
 d75a77b69052e-51461fb1949mr384399651cf.45.1778574909069; Tue, 12 May 2026
 01:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <agGW6FCbnIyy_OuE@fedora.fritz.box>
In-Reply-To: <agGW6FCbnIyy_OuE@fedora.fritz.box>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 10:34:58 +0200
X-Gm-Features: AVHnY4IGzwKh8cpEe6DCcQkdz6K7ue3d7clb57ySdTj79DPpRlJJjVaw0ngtEjI
Message-ID: <CAJfpeguYt4zgkTsM6nAvUSxqSZQm18DZpMcJZNWuCiSmV=BGJg@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a9f38306519abd8e"

--000000000000a9f38306519abd8e
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 11:04, Horst Birthelmer <horst@birthelmer.de> wrote:
> @@ -1337,6 +1338,7 @@ static int fusex_send_opendir(struct fuse_file *ff, struct inode *inode)
>         if (!err) {
>                 ff->fh = outarg.fh;
>                 ff->open_flags = FOPEN_CACHE_DIR;
> +               ff->nodeid = get_node_id(inode);

How about this (untested):

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 3bdab8d03373..1b5a262147ef 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -594,7 +594,7 @@ void fuse_read_args_fill(struct fuse_io_args *ia,
struct file *file, loff_t pos,
        ia->read.in.size = count;
        ia->read.in.flags = file->f_flags;
        args->opcode = opcode;
-       args->nodeid = ff->nodeid;
+       args->nodeid = get_node_id(file_inode(file));
        args->in_numargs = 1;
        args->in_args[0].size = sizeof(ia->read.in);
        args->in_args[0].value = &ia->read.in;
diff --git a/fs/fuse/fusex.c b/fs/fuse/fusex.c
index c4bc03e57ed7..43c03d7f73ab 100644
--- a/fs/fuse/fusex.c
+++ b/fs/fuse/fusex.c
@@ -1379,6 +1380,7 @@ static int fusex_dir_release(struct inode
*inode, struct file *file)
        ra->inarg.fh = ff->fh;

        ra->args.opcode = FUSE_RELEASEDIR;
+       ra->args.nodeid = get_node_id(inode);
        ra->args.force = true;
        ra->args.nocreds = true;
        ra->args.end = fusex_release_end;

Thanks,
Miklos

--000000000000a9f38306519abd8e
Content-Type: text/x-patch; charset="US-ASCII"; name="fusex-readdir-nodeid.patch"
Content-Disposition: attachment; filename="fusex-readdir-nodeid.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mp2dk0gq0>
X-Attachment-Id: f_mp2dk0gq0

ZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvZmlsZS5jIGIvZnMvZnVzZS9maWxlLmMKaW5kZXggM2JkYWI4
ZDAzMzczLi4xYjVhMjYyMTQ3ZWYgMTAwNjQ0Ci0tLSBhL2ZzL2Z1c2UvZmlsZS5jCisrKyBiL2Zz
L2Z1c2UvZmlsZS5jCkBAIC01OTQsNyArNTk0LDcgQEAgdm9pZCBmdXNlX3JlYWRfYXJnc19maWxs
KHN0cnVjdCBmdXNlX2lvX2FyZ3MgKmlhLCBzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IHBvcywK
ICAgICAgICBpYS0+cmVhZC5pbi5zaXplID0gY291bnQ7CiAgICAgICAgaWEtPnJlYWQuaW4uZmxh
Z3MgPSBmaWxlLT5mX2ZsYWdzOwogICAgICAgIGFyZ3MtPm9wY29kZSA9IG9wY29kZTsKLSAgICAg
ICBhcmdzLT5ub2RlaWQgPSBmZi0+bm9kZWlkOworICAgICAgIGFyZ3MtPm5vZGVpZCA9IGdldF9u
b2RlX2lkKGZpbGVfaW5vZGUoZmlsZSkpOwogICAgICAgIGFyZ3MtPmluX251bWFyZ3MgPSAxOwog
ICAgICAgIGFyZ3MtPmluX2FyZ3NbMF0uc2l6ZSA9IHNpemVvZihpYS0+cmVhZC5pbik7CiAgICAg
ICAgYXJncy0+aW5fYXJnc1swXS52YWx1ZSA9ICZpYS0+cmVhZC5pbjsKZGlmZiAtLWdpdCBhL2Zz
L2Z1c2UvZnVzZXguYyBiL2ZzL2Z1c2UvZnVzZXguYwppbmRleCBjNGJjMDNlNTdlZDcuLjQzYzAz
ZDdmNzNhYiAxMDA2NDQKLS0tIGEvZnMvZnVzZS9mdXNleC5jCisrKyBiL2ZzL2Z1c2UvZnVzZXgu
YwpAQCAtMTM3OSw2ICsxMzgwLDcgQEAgc3RhdGljIGludCBmdXNleF9kaXJfcmVsZWFzZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKICAgICAgICByYS0+aW5hcmcuZmgg
PSBmZi0+Zmg7CiAKICAgICAgICByYS0+YXJncy5vcGNvZGUgPSBGVVNFX1JFTEVBU0VESVI7Cisg
ICAgICAgcmEtPmFyZ3Mubm9kZWlkID0gZ2V0X25vZGVfaWQoaW5vZGUpOwogICAgICAgIHJhLT5h
cmdzLmZvcmNlID0gdHJ1ZTsKICAgICAgICByYS0+YXJncy5ub2NyZWRzID0gdHJ1ZTsKICAgICAg
ICByYS0+YXJncy5lbmQgPSBmdXNleF9yZWxlYXNlX2VuZDsK
--000000000000a9f38306519abd8e--
