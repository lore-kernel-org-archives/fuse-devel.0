Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D84CDDCC
	for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066148; cv=pass; b=VSvn+LEqQ77+ZZkaEs6EfvlrGwtAVYQXWkGL8eaRY+DQM4ZtrUYb0dMOTgpj2HaGdiJ3XrKxvEi1jQ/NZbcd0596m3mq3EBqPbTvKP2uLqW4cMeS8vI5ng7pQRNzB2Ac7eaXr6Q/aCL+u4GSI+6y34lKQiT3eyzcNNp8x1mKXgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066148; c=relaxed/simple;
	bh=Tn4Bwf989zU+vfqBKp/1hHI1RbuQhdvNeZ4zj4a7kQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTA8ayBScqKt2+dF0LxDvUPymwl0bc2IxEftj/ddgDUH5lmQcm47WkJocqdRw5swWnD8VGFU+24UDRiFI10R2YxpSbEzZEovhZfOb8JaqmGNqQhXETDiK+qB+rOEK/EyN0Gq5QTNOES8JgQhzbJc6YRDg38/+I4n1vHMS85yXRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Omqwj/yG; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Omqwj/yG"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5350cc60b51so72223101cf.1
        for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 05:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066146; cv=none;
        d=google.com; s=arc-20260327;
        b=ju2MLQb3RrEj6i3iNdxelHc42KXImsKKc3LrkEHs6uB34bIuY+Ixpe2LkpQrRLDXit
         IRruiq3rEH4/hOlL8AE5HmuzvKBH9oPokk/FsrHK/lug/EQOh4vrxeru3TDS4I56+UFq
         edNuQEgPciTW6Al/np8hWjLEm1xt0sV06dfShdKB4kjTF7PuJlZ8bZtS+ZYRSsyrmUjF
         Nr1tWzNPjI5Q6hkXDJ7PUA54N97ArSrkV0RShGSXRCE2klgY7T/ZO62rhSknpqUL0aXW
         vImO/6+LEkhy2vGpdjihB+guuuLRjuF0Bk8pIZ4eGsNBRQgwG1KWw5PMoa0i7E21jdgo
         D+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        fh=dWbqDLy2CbIo6LelM/lIlRGf7D+qtqOcaarHgoEpT2M=;
        b=Kstcjg8V7ZTih5mbtTtud4jpYsrnSZeDjkHUFS9BYBp5K+OvHTg/K2Dbm6PyggazGX
         FF+eY0OYFGPfcAP4P3EGAD1VmIpkqSvNiWmA79aFzHbbR3aVyU+18ULfAYFpdr1qPJNX
         H56e1cQpD+JoVIfdgGBc4+CNNRn9IaLEsNbeRE+yFwZo73JpHqAUqpRqBBdx0ptG3Uoi
         DLGtr74E4XqdLLrJ2/NDqCKSwn3qEycmJiPXPUrRVc8fNt+Xg6R1R7gi0m0HE8oK/zYG
         SfjfHPo0ZfkANhqcVlSo2tEt4pjg+d/gy0AaTH6Z8Sgxz0j09NpwFOMYhHH2FUFCgOY5
         o+dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792066146; x=1792670946; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        b=Omqwj/yGg+GWkX4A75czA1gVGhU0A4luqYbeNVkcTxrVfhF6PODRD7nSiXoU1Ksv/q
         UZPlFMX5loh0y3RD/aeWM6ak8QTGm2UspXSgeIvbk6aQ86tA3JuPxO+Qdg3SS3nd45XB
         wdy5GB+O7bdDHld9xpHyzDTlyF+8dXSQ9Wwjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066146; x=1792670946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        b=oUya99AxGAehBarHGOPkbnsGvvsPRMRNiqoo9e9Q3drBD/BvW4ne/KtdMcBqTUuQ83
         9FFq0bKE9hB1fHnqc+o0cjKAbesUDBpaGjlktByuteVnkLoMCZfRIhiFi00nDiMyZhMO
         RnQ2lKhAh2lhk2Fe9Ebr4pLgiCKZWiLOJHnBMKjp4kut/yrndDw4ZxGIv58ICgdvYV96
         0lbVe4ueh5PcQO8VFZY8tUW8DhK+M8J7JH8aFc0b4VfF7N5JKcmQgVbh8HvwPcJ2VChd
         sqlV7QmDCQYKQ1amOxRwz98trhD+l7t9vloZVmYigmxTypuGYt5L2KGIJabC2k43DJbL
         dcpA==
X-Gm-Message-State: AFq9FYLkwZISoY/G0eLeMKqJulbDy3wWbRBLp3DBxr0TycyK94sVtky3
	3tyrg8ghm7AQ2lZNh6pGn2xaX4uOF/bPPLPdQH7zRtkukUSHsnQsJOR9btwoeXNu/cbBiwrra1p
	bwz4T4lVKBs5XZpxSuDeO6sWAxeQn/ZDQEp6EWWp+LqtoBVkxFG+vixg=
X-Gm-Gg: AYBFou21dpWVhyT/+paXfY8zc152eipuarDSj1xvJIfF6eXu1syahElpfn5RzCGuoZO
	xYgsXgSM0VlSACDYQFhi9TJN9ZQ2vFal7h5us+6BCXX2fpyKfH4IchOp852t3vziSckgnlfXEKo
	MpHy7aa1xntaDykZRbBqpl33cN0yYrCm1gWFdcv1YU/0WHgN/mSDhvnDG6OvDM9bSlrbO5L4cVt
	99V/p83CZRlId7mGu1Ystqg/l/9qNmtG5Z/IXxxNC13gZl7+1GpCp/R1zeaZ0e7mpNfKFQ9ZMEj
	a1fokGvq8nI2lX7TUXi/R4XCsDsgfP6daQr9H42kB7B4Pcg3tHsu+0XStGcWQN35Oqp/P2qoH4d
	C1nX5tEdC5P4xv2vSuw==
X-Received: by 2002:a05:622a:a16:b0:535:942:4ed with SMTP id
 d75a77b69052e-5359fac5cbdmr286651061cf.21.1792066145745; Thu, 15 Oct 2026
 05:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904131838.15365-1-luis@igalia.com>
In-Reply-To: <20260904131838.15365-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 14:08:53 +0200
X-Gm-Features: AclHuK82MH_mxYUUmp77R46slALlxKhYAwe10M4u0YwuKsLiUCLpMllctRlmFMI
Message-ID: <CAJfpegvdnPeyp8MYz9Y+v-nKNAj-J9N=nFyELfbB79nQJUiRQA@mail.gmail.com>
Subject: Re: [PATCH] fuse: rename fuse_direct_io() to fuse_sync_direct_io()
To: Luis Henriques <luis@igalia.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 15:17, Luis Henriques <luis@igalia.com> wrote:
>
> FUSE has two functions with very similar name: fuse_direct_io() and
> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
> the ambiguity.

Intention is good, but fuse_sync_direct_io() is not the best name,
because it's used for both sync and async direct IO.

How about fuse_do_direct_io()?

Thanks,
Miklos
