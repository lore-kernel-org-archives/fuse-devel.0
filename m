Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB636F8E7
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735416; cv=pass; b=H8ESePfd5MqT2oS2Hym8al6F5xCq2uLutUUFHKxk9MKBMExGq6BdZ1lQyA1tK6Cw97ggnEq819A0tYTp6ODZZK5zsDb7E99RoQSKOBhGWFVyIw7S3dlslVsOxr2w/6oYbqxBLAzhTXbRFltw2PEiKpkeGjM5m/yoQXZeyGfLSLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735416; c=relaxed/simple;
	bh=82+/rJRxe1A3N7v0gpEVZcaLGNVoY/OCf9aJAhyYy+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPtdMZT5JO6afV6bKwYVnbvJfrQJtT49aquCvkOT51tp3wBV83KlgakCNN1H1Ge+V5sXKo/GirLukwn6LeS6jwa83lZAMH5jzBq0vZoIzB/e6Us4pCU9UaZcpHQHZhy0NW4Wodp+29Zm2gdZMTXSUPGUjn0tMDrAKOojwG9zJB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvoWlmZ3; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvoWlmZ3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so5425955e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 12:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786735412; cv=none;
        d=google.com; s=arc-20260327;
        b=CUYVIsW1reP7vyXeoRCdl5YAndliCLziHIzXiLqelcZ3GJoaK/5qmwPy8VcvoJI01I
         JWUeHGCg/hOAHyfkeMl5Jq45N+2wbl7LimcwL2Lf5WdU4/A4jdVCWUrBzTHWhTrPwuVW
         YZYudTFKdd11hu2LgzqCUlDJEc0I1HYXofO3moW+dkRNGwdzEaqdQUl697uDqve6uv5j
         a/7MTC8Tyk7v6nHUZ7lBp3YCNpfMovhVUZQDYEa8QppKUcoGxdIH0vzgLi12xwhQgPhA
         UCyqaDvedICS9QK2Uazcq9AXDdf6kGUY/nGQ6g/P/RiFkvfatIQJKgQ+JZ48kn+pBEgr
         f6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zm1rAlABtI9qDTB2yAZCJLghAvJmchjYoEoF5LqZPPQ=;
        fh=PeSg35iej2DdkudF7wFAc5OA5DEw8mS6+aUnUitJwMY=;
        b=squD/yTurTOnS2XF6RT7VMH5lfp0v6ybHSPPynTr9nrvktGImdUcPspcIQrdN0xq8l
         30ROdNxhtiPCXn514rhauXEIH0ES+kmUgd8F5pjqqAoyAtbGx5mJ9ux8oeCEZzFF1ZCd
         s6c5eeUcxdthsAv1guNR87pGvl5wDKzYTq/RpDsJSHfm4mDAE+9X1rRs0O6vh3ovf4Rt
         PXOsKedNQ+CHi/q3Xks4glJa4prlCYB8N+40WoaGuv17Dxql9vMyL8PyGOEGGNbl0P9o
         JfSQpjoRPdVCO2UwNe4ovrAVEGRGsOt1dIZkCAYO60qjBlH6sO/0wRY+QZgoYCWpbYN1
         R2Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735412; x=1787340212; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zm1rAlABtI9qDTB2yAZCJLghAvJmchjYoEoF5LqZPPQ=;
        b=SvoWlmZ3fSn0mwGU56aWU6xnSVD2iNmlEzF5xnXY49HKaiSF8AOyMxiCXrihK20WFl
         C7Lwfx6EORrM0eDGpu+p+vSS52PeFgoubpSizpfnuPzs8HGm9c3YkU7n0nTeakQp0EyZ
         7G//rhMLZ5tuwGtw59hUKe3nkmJx+Fg0KOGiKRZYX8kpX+5mgvTT2oMpYjRse/jBEJ8h
         rjnC32c+PtAjUpBdCMaxn49Dw3EmCKijz5msQ2li7i/q3Yryk6yqzxm6v7I1FzZzbK7B
         9PbY0o6xol9oYDAzoIK7FYKK59UjFVWWInVx74HveuMVRvXt+xZMVecipXAFRJN9kzz0
         cMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735412; x=1787340212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zm1rAlABtI9qDTB2yAZCJLghAvJmchjYoEoF5LqZPPQ=;
        b=JIuv8o0OBxJ0EhDazAItweUNBIQsj4jxw888Mv48mwZtubRogbGF4tD9tNDDRaGkQE
         zz3Q4F5F8RwNhXzpIRzBTRVLcLHK4K+mx+uPnYQStb7BPuBYtifXgqhn2c3WmgBeznQU
         BgUl/UVAnZ72FMes4B5g8zy9tEA5RwZO1p/B0hpe1VfolFadiGSHYjPB51m2sOgwp7NN
         wXr0ZHX3Ll4/NKFM9nzjiot5mlF0vXOC3OEng5F6vCxiywllzKLyIttRkEW/JUtDqsNk
         Qo5EuUcqu4boCurJd0I3260jkWCrY4o1vsr1GXHGMTCC9U+m8moX1Mts/RB8JK7hbuI6
         0AxQ==
X-Forwarded-Encrypted: i=1; AHgh+RodEMmJZm6esJD9gIDIlPsjWI/U9SOzDKyT5nG41Y5JVUTK3TtXY6QTjlBWdwqtj8LRE3GLQl6tMSfB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0R8sljqz/AZOx/cuh6XYYkh0DOGBeH74FoWRKcIKeiPJAifu7
	gPcS60XWES/gFXauwSN9EFdEPgoDAX2CDKc/27r8DAPTYRD3GUkbUYHTTZfbprMwlAN78A0fEjz
	WQbn0GATib44sUKzjf7q08EBtivCIhLE=
X-Gm-Gg: AR+sD11W6Cw9zVfgNmRA5n2jEbPuKUXbDa1Hit12x55qzZkDG57ePSkT1GCeX7UBhWm
	AVTPhzkQsqA5beh+Q0XBafwXIi83FIXcdkpJu6huWoiTBeYBiVGWG2OAyi/U+g+WIUhiNtfTOGK
	lZBagx+SwMvGjHfwX0yEEFt4dR6VbSxm1dbR4W+ivIIlCfcVMtT+XjpCpYuhNzYe5QFvZpTfF67
	SvBnjKeM/L7GKGGIq/vCY3pSU710esRi/WcaRmIiDaC2PbhQqtPgfeQG1xXpxdpCSFxgcdxeWKB
	+6JmpiSJ8rtjdLPi5XJnwTqk0zXE7IRbKzz48YWxyFtCQRNrtaRQ2z5Km4h8eY4HsdmY1Om6mbY
	G4nlGXW5iTAjj9mLM3ywrntOZtnXREPrQnjI=
X-Received: by 2002:a05:600c:8107:b0:499:60bf:c6f7 with SMTP id
 5b1f17b1804b1-499879665ffmr129608715e9.13.1786735412150; Fri, 14 Aug 2026
 12:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 14 Aug 2026 12:23:18 -0700
X-Gm-Features: AcwNN1VU4X0stTqnhdK9re5pMr_6AODeKoUxEbAMayjOSG_dLMUa8j35CIW6IJ8
Message-ID: <CAJnrk1YfMEoYAp597=jhPzezd2VN5t+hc-7OE6Bam-dibGbi+g@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] fuse: add io-uring buffer pools and zero-copy
To: miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:00=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> This series implements fuse io-uring buffer pools and zero-copy.

Hi Miklos,

This series is ready for the upcoming merge window. Bernd reviewed v6
[1] this week and v7 addresses his comments/preferences.

The 4 io-uring patches this series depends on are queued in Jens's
for-7.2/io_uring-fuse branch [2]. There are no changes to these
io-uring patches. There will be a merge conflict when you pull the 2nd
patch "split io_buffer_register_request() logic":

diff --cc io_uring/rsrc.c
index 40807994a8f4,666d3a009ffc..000000000000
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@@ -1057,15 -998,7 +1086,19 @@@ int io_buffer_register_request(struct i
                goto unlock;
        }

++<<<<<<< HEAD
 +      imu->ubuf =3D 0;
 +      imu->len =3D blk_rq_bytes(rq);
 +      imu->folio_shift =3D PAGE_SHIFT;
 +      refcount_set(&imu->refs, 1);
 +      imu->release =3D release;
 +      imu->priv =3D rq;
 +      imu->flags =3D IO_REGBUF_F_KBUF;
 +      imu->dir =3D 1 << rq_data_dir(rq);
 +
++=3D=3D=3D=3D=3D=3D=3D
+       nr_bvecs =3D 0;
++>>>>>>> 27eada8066bd (io_uring/rsrc: split io_buffer_register_request() l=
ogic)
        rq_for_each_bvec(bv, rq, rq_iter)
                imu->bvec[nr_bvecs++] =3D bv;
        imu->nr_bvecs =3D nr_bvecs;


that can be resolved by applying this:

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index e1f4ad026f16..dfc2e63214f7 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -958,7 +958,6 @@ static struct io_mapped_ubuf
*io_kernel_buffer_init(struct io_ring_ctx *ctx,

        imu->ubuf =3D 0;
        imu->len =3D total_bytes;
-       imu->acct_pages =3D 0;
        imu->folio_shift =3D PAGE_SHIFT;
        imu->nr_bvecs =3D nr_bvecs;
        refcount_set(&imu->refs, 1);
@@ -997,19 +996,8 @@ int io_buffer_register_request(struct
io_uring_cmd *cmd, struct request *rq,
                ret =3D PTR_ERR(imu);
                goto unlock;
        }
-<<<<<<< HEAD
-       imu->ubuf =3D 0;
-       imu->len =3D blk_rq_bytes(rq);
-       imu->folio_shift =3D PAGE_SHIFT;
-       refcount_set(&imu->refs, 1);
-       imu->release =3D release;
-       imu->priv =3D rq;
-       imu->flags =3D IO_REGBUF_F_KBUF;
-       imu->dir =3D 1 << rq_data_dir(rq);

-=3D=3D=3D=3D=3D=3D=3D
        nr_bvecs =3D 0;
->>>>>>> 27eada8066bd (io_uring/rsrc: split io_buffer_register_request() lo=
gic)
        rq_for_each_bvec(bv, rq, rq_iter)
                imu->bvec[nr_bvecs++] =3D bv;
        imu->nr_bvecs =3D nr_bvecs;


If it makes things easier, this is the github tree on top of the fuse
for-next branch with the io-uring patches (with the merge conflict
fixup) and this series applied [3].

If there's anything else you need, please let me know.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260716175908.2339738-1-joannelkoon=
g@gmail.com/
[2] https://lore.kernel.org/fuse-devel/04ab6f18-f668-43b4-9e03-f63d45460742=
@kernel.dk/
[3] https://github.com/joannekoong/linux/commits/fuse_zero_copy_v7/
