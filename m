Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE66446830
	for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518982; cv=pass; b=a8aK1hm1vzgMm5nO2CeIuY+rK6N+DbmxkeJC/V4IpsOpiDkhxAY5b9DRycdWY0saFQO00GSlojF7CEzfdtlNC2baVy0ViEeGHrYsG7MTcfGO4LjpDIr+WHdzDMuV0V5ay1Z59U6NKIGLkX6lGXrMlpViMEDqfR7u5srfv48bhIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518982; c=relaxed/simple;
	bh=ltSG9Hlxo+QdEflXofV1+I2D/0M3HtsFoks7deEIxEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aunz57hc0nlFI5ZFCSpmtj4frXIGcr3+lE8XOolvFSh+MUG8XyJN/9JyDSoOHp0nPEBiYyFknA4mZIUUgcjEkX1sUzbBpbED7/xXPmW00mqSNFzRF/VmuzSGS2lu8t5WB1oAGdeAOLRn3WhpKAZUPcVIo+VyOVoFySrCJi3y4SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPfQw2xB; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPfQw2xB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so649449f8f.2
        for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 10:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518979; cv=none;
        d=google.com; s=arc-20260327;
        b=UY2uh5XiU6NwN9HZWvEgY27YZSS2TFEDpuPWStMRHS2oYvp8d6CEtu8rnsch55X3M6
         +gE77VBCuxCCy8VZ9XAegHLCRTaCkDinPRV+YwGg5GAp/Xm2GTWKklmLjKx21LVG3xQb
         0QxaHBPCVrFGREzAZoZE6jB5o6C2YN55crs3K6lyIexqolEeNGuDwIBoNLf3/2XNriVL
         VUZc2IywE0N7WPZzNWoAdRKcuSrZ/8D/MCLpSy2O5JyyrledExl5p5ZpsgdBl8YHVebb
         J/dHIEbNOUOJNN1EDtyocW8nuBQSH259IbiP1JNuRQGSyDQKTJispvBqbNxRZ+3eIHVo
         M10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltSG9Hlxo+QdEflXofV1+I2D/0M3HtsFoks7deEIxEI=;
        fh=a7xgFANURfQUBZSnBO4+NjzFqAaWpRU4oVigNmd4rlg=;
        b=OblQHC66qyLpCJQVXLXrP6DAp6tSR/NoRQKb3oNADJnteppM7yR6vYKoCX5f1b2Jv7
         pSU2AdXzzzoNUxaE0vd06SDxz8adpo10YDsyuteSi0151Ix8AcNu54VRACNEUsi2GZ2G
         IsJTRPwpBcfsyaQX+9Vgku1DSfw2zS3slfi0qwTooPJylEWx4fxyEJUl5VTuih6Um8bq
         AsVcrmcGCxf1iP+UGDjr/yPQ5UalbUCVZBs9/ENDO5/O15px72Hq5XKYCJgLLKa3onTI
         NGGkEGwp9YBOwa9Wz9eFBnUqpZ5vujN/6I9GLIaqT7mHHgVreLLNCnQAvrUz1qMU3DAv
         wVRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785518979; x=1786123779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltSG9Hlxo+QdEflXofV1+I2D/0M3HtsFoks7deEIxEI=;
        b=iPfQw2xBHUmm/ric7UlG/6xWMlOZ/oDFJbaz6dDVOz6o7YT1i5OXxfAk0s1rH6sN3S
         1dj1QDcSwayVbsgK4KXhPSjJAyHevbX77c8jWsVkzaKMO4KklkLrpvgZGPo3E78ktVr9
         plFUP/Ffr2Os2WBFywWik61FZuoCdbKfseRp4kM6d16CtGnyB2/Dls5xqTj8l8dWBfpp
         MORIh0IT4Gb+XvK7N/+SP5Wg/eEF3H5M+Ni/pr7hyRfLCUVTxXbmcfEXkLFmoRkeOSBi
         +tTyCV6LUb0Zg6XmPeUnIikht4uYNfp0lEvIM8ePId+f6hQ1ODOHGEpBbNnNbe4K/8uA
         MfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518979; x=1786123779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltSG9Hlxo+QdEflXofV1+I2D/0M3HtsFoks7deEIxEI=;
        b=snOeY9CpOlmPT3OyyDkT4qwUxfc8yNNzie51/lkTxhne19/SSVfsJPyJ6M4Lamy662
         MDH4qLHvwqwUUR8PLLnnXRtTioFuM+mZx12+GN8BTRRHtJr/JLZ0n4YJ0MujdAcU6hER
         bn/gErUsLlHDyRaOPWAKUwFu/7+efhuF2dKYSd8RIE0gs6Gc47uFfzjCCdsbG/jqge2I
         2Dv1/JA3EzT3tumh1JvVr+1kxq90ZtzBCC7avj+nv0586R3V0mXgejVSpPw393fFkizP
         oYKH6+kMLVN/hpCC6FdLDcPqRICMhJ+mkw5Poafk/Ic5Fl+J2bzBoS4r/ylzsHnOweQf
         TdtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzIPkfdE4ARJFQQ3yuuppcmH0BRiufJHgmfIkDS+6db1kHQmfvphVmCA49Ko4t8hKyFwwPIjlGBya2@lists.linux.dev
X-Gm-Message-State: AOJu0YzLopMHtGBdBm4QeRDncSXtxs3PCXnOvMrdx9NCZXMlfY99RwPX
	/0KFrvgm+EsBsKaZl6WcZdhmg3RRfCPWOcb7r6QccRy6BkhHYSRkeaYppIhxT3cvEMHUyjz/LBG
	tRhmKoCHPXLZlU/UfWbH5j9wUoIk/Qfk=
X-Gm-Gg: AR+sD12WS7CcoA47WlQGUPkdMEtyv7IWl1F6CvFFGKnSeCxpJXKAD7oF46chHpw2AEz
	P1Jk+e7MdgNHLWiG4CfmlgpGRZRFkaK11iNka1316aWDHCT9pY8YltWMwG6PeEpQBP40YgO0T5w
	COlyLWj7TgtIyI7iJeqiMBL6+y70NySAhT25F1XpZTumSrDseUZZGGeQZsvLgKKWfyFKwrtGl4j
	8cuO7K82Xm9E5MgIUnMVG0bZgCKMi1G/MVdiLcV9ltztpCVhAvhq26Zq4t+42vIKr4UZsig7hTO
	mJk+qVAGeVc0SJ6lxLG9wqYSSQRnmdoZi5+TF33WH2TpJsopgo+zvHzbx7Cgqbkh3hDtDzaHDx4
	twmKh6elShnMLoPmyGGMLGbjaACnkUJGT1x9n
X-Received: by 2002:a05:6000:2311:b0:47f:c62e:9cbe with SMTP id
 ffacd0b85a97d-47fd72f08e8mr1063493f8f.31.1785518979167; Fri, 31 Jul 2026
 10:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731154440.1117457-1-ekffu200098@gmail.com>
In-Reply-To: <20260731154440.1117457-1-ekffu200098@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 31 Jul 2026 10:29:27 -0700
X-Gm-Features: AUfX_mybUcSTQYAYhOiPqPjw7xYcP5l-oiW_FZcZGnM5KUu8EmQe97t8jqN3rNg
Message-ID: <CAJnrk1YO+ToJiv3JAyvuMQ-AUDug_P_0=43EDnwsBzxqb6uQVg@mail.gmail.com>
Subject: Re: [PATCH] fuse: use min_not_zero() in fuse_init_server_timeout()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:44=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> fuse_init_server_timeout() limits timeout to fuse_max_req_timeout with
> the same logic as min_not_zero(), and returns early exactly when the
> computed timeout would be zero.
>
> So use min_not_zero() instead and return when the computed timeout is
> zero.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
