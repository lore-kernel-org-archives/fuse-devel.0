Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271188;
	b=q+lRGlAWLIHS5g+3pV0WAKjKwzfKkcJmgooJI08jcM9vp8ZT/BFKlw7tNfaAYdGNfn8p
	 Kvt/E7xeCv7Xe+X0P7p3/aVaN9zf4/BCBeBPY1rtL7bX/8iVvAxEv6kd4Ql5ElHXXI51w
	 nZtYYe5aquOIB8lQF11SArfkLszlKBLOzyKzXhc8ci6d+IaSmaGIO30R9C9E7BkLlJuxq
	 MIU0uEoR7S02VqQ/ARJvHZlTA86u1aA4k4Rgg7VBMAMQlXNVPZLfciwM2TurAXU0YC75b
	 nz/iymn5mmo2agkFLSuTP+k1vi00Q3AkmSV0NQBqOnhtxxly07lDHvUuy3J1qN08bPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
	b=OffiZpq+XncIFthzvFAyeRnyXMK93OZy26+4bW0XZlvh6ZyeYS0RhGQnGxyZVFPeWq4M
	 TS7TQDnXN65PkKtrPg+GjI9p3lXSLr5hk1h5xGwObl64MkB0x8BFJw+50s3iy0rpWJImn
	 B58bVTH3EaQvZB7tH3licfD3KR9s+WHuTs+LmASPP/HNrl4ei9VBerqD1Yxw8aJIBGvmD
	 HsiM0SuKslsQjUaJGHLzngGT3C8X186wI+RJ0uQJ/Cu5yLCXJsVKZnJ/QNoeu0zzgD4/f
	 hBIsEfYRn85QBevhSb8HQ3XTgIBkFPH6D7CuPb96To9BmTCEF4oAsNer7bvSlfSgsNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZkZZ1tV;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CC606A326
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZkZZ1tV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df4f540ebso970257f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271186; x=1793875986; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
        b=oZkZZ1tVZctHLLzPc0TJtZf6JNriIVLTRvjRfsQFZm3+ErQJUxn0qdxtPPahncQ6Gx
         /DlSgtu5gdozJB9xJ6BLKS0gT+ZyIUXEt0Hy4KLBZKuV6sLMFL9BZBXFHihzcQzs6o6c
         zkxE1OefwLvIf6E+D3cc3TDj4lY9bDArWHh/6Cd+EETnyYc7AzbLSWBPxJ6Kb8zpukEP
         MMmQT+7IXORWBJKCMBzhyF3U1BDEUfgqsrDj8lJgNcHmyzYMgVIjXSUNGyXsc7MrAHRl
         rtFVwI56ULL7SJ4uRoNiORJkYV46fu784qV6syL/RDqxHYfwF2gDWnX3ddfL07KYrGCL
         KkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271186; x=1793875986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
        b=U5sewEUvNgkqJbkYA0T3dQGUWKBTUfhCxM/yOf19M4kcnZpAipKExvqz61Li6oZLPa
         xQ4LGSiZqddxuX3YWXI8hrGCXZuQXP2ZTMV1d86eie94LpLOnLsq3tLeTDfGqmRuBif5
         Pe9e1lz2Wvae5m9xuew4nxTOK6rHFB9V4muuPZFcmqiW+u4B0DGkV5sEJi0c+t2H3dLv
         D5UZYvjPuZ3kRrmkRcaPbMTXqurgXqwGt8Z5CawsYgq69Gub401AOnP8tJZiFuGAmRqk
         azDiIAiIuQnCx0cnDQ/0kxZ/pvVM+qg6h/HdT7f+sMPMMMktTQQ7RIEkSwUQ3QZIY/tp
         4e7Q==
X-Forwarded-Encrypted: i=1; AKwUvByUfQCOodLtcm5Zoml7BBIajOr2WAkho/ipqX5K/AosLIJKIFRVUJxE/376QaTsqo9XQRkhHgEabxIW@lists.linux.dev
X-Gm-Message-State: AFq9FYIqxLAn8eaVuyPNwaC6/TdOF6tcMRU+lYM2BSzKu8FSTYO1dt0f
	VvJqe2rYLeTl+u5JB6n4n2jUN5d0zH1UfMZcSWZD/Tt2CkbuMYgzn3TS
X-Gm-Gg: AYBFou1AEaE0pA19ET8tGeTq2kO5e1/QsWi7doadvzYznVp2SyuFHc1PFTvTfZZZSLD
	vxw1Lovh0nQWDgRYyIBiA5efhlT7qrWDmvQS8vBkynctPLBx201wqYSl79r+RXCjIKZS3k23/w2
	Aidg1CGbDCeOVOMeIvAV82onxB8d+Fr5k7PHmtS42XdRytctcO6wsJikVCYYHKI81JvtltPwHrs
	o7aq/Kbfy/m2VjX1px+cM4U3nmmz6AeHmyTUIDCKpZhTLUTWiKHd9cxAPprQW5lEPAayqTAxnRl
	ppQYWC9x4BR+DDvJOJjYhaZQtZADhWQHh8CTj7f4FcfPegbxDtEIHqgzpdwnDADJK4cID4ap/3e
	nPS3rZ58wAGIuv2hMGjQlQVKzBmpbo3KKjO8q6qeGBUzvb6w9NZIj1uSJHDMXcfCTOGxAUQCwyL
	kGWF+GtmhItOqcqxlhbcl1msiQdofLin/sXC3ImYkQkRGz/SPO5nJ9z2f9zsL3LJR58vUwMZpK3
	85gAI36Qw1npSOJeOp9m1E3wzaCj3DGxknGhhn/6QRolasy1VDorF7alwGPANGVRNBYiaG7zvnU
	acPn6qTt0mhDEZbxWAzknp1y3WGPuLuTrqy3vR5gbbEOBqWdxPE8eG1hNwT5JI6gxHyxioSWsN/
	mNQNIGL4Bkrc1ikM/n/ANg+rWN6PLAGq5nxkUOL5rHkhPALAg6IBDmS+lhLS8g8emQRtSwCQixh
	ISi1y4uBizfLa10QIq1SO8xPQ=
X-Received: by 2002:a5d:5f52:0:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e5d2e6d40mr12705105f8f.16.1793271186318;
        Thu, 29 Oct 2026 03:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm31889960f8f.7.2026.10.29.03.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:53:05 -0700 (PDT)
Message-ID: <7fb73a55-c7f8-45bd-b12d-e46f1efcbe67@gmail.com>
Date: Thu, 29 Oct 2026 10:53:07 +0000
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] nvme: support dma-buf registered buffers for
 passthrough
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-6-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-6-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Allow registering a dma-buf against an NVMe namespace character device
> and using it as the data buffer of fixed uring_cmd passthrough I/O.
> Complete through io_uring_cmd_hw_done(), so the dma-buf map is released
> at hardware completion.
> 
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> ---
>   drivers/nvme/host/core.c  | 16 ++++++++++++++++
>   drivers/nvme/host/ioctl.c |  5 +++--
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index d81462e864a4..6157ff839929 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -8,6 +8,7 @@
>   #include <linux/blkdev.h>
>   #include <linux/blk-mq.h>
>   #include <linux/blk-integrity.h>
> +#include <linux/dma-buf-io.h>
>   #include <linux/compat.h>
>   #include <linux/delay.h>
>   #include <linux/errno.h>
> @@ -3982,6 +3983,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> +static int nvme_ns_chr_init_dma_buf_io_ctx(struct file *file,
> +					   struct dma_buf_io_ctx *ctx)
> +{
> +	struct nvme_ns *ns =
> +		container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
> +	struct nvme_ctrl *ctrl = ns->ctrl;
> +
> +	if (ctx->dmabuf->size > UINT_MAX)
> +		return -EINVAL;
> +	if (!ctrl->ops->init_dma_buf_io_ctx)
> +		return -EINVAL;

Let's return -EOPNOTSUPP for consistency, with that

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

