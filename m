Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8B446BEA
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141122; cv=pass; b=XbCG+0SgPEBb/1wVV6TTVo7kr7sNkgTFriNmEY3vrUYbqSfFArkbOoMXoLgHbaf5r/9Jg+QFMjO9ej+bR6JlAdWGQH6h1C+yf/NvRM2FcQKJbaMhDIc6h4b1EDOlPBfMs6OXpl5I58USARm+VQu4dopDOyHRYkvgo1u4bEtQ7w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141122; c=relaxed/simple;
	bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3DW27CtwIJxO2NzYaOO6DhuODDbCm9vAdFPm8fpzgVb7A9qqGgfMIcZmeARu2kAqdt79X8r+Gd5QUIb7mB9DhrvAs3FFD7vOTJ169sIz32GsYPf7z5f4TIy2gFB94kG8ndL8wk7NiU6MHTbobRwCSPR4PmWndSTvElpjrt71dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pCBhLXzY; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pCBhLXzY"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-534e6545939so20173841cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141119; cv=none;
        d=google.com; s=arc-20260327;
        b=Ekrkd2QPf1Ppsg+pcnrgOV4tVue5AuTkRtzilt+CDBirkKnTff1Unh6k3/qGxDpIfR
         wOo47qNKtxBQiqx3yKRy6rJ1WDNt4TwLOwMiezc7SWElw6G4Zg3aW9Kl9SRlAHtUPSfh
         1D0Sp/lGcMgcL0CGG8yHjoCKGEUgNjRZcOatd65Cr/QvygEV4BrQZgikEqNTTIFjc2SO
         goPIGcMBh/LbW4vTXE3ry/we1cZcgxxUJHXqPPK/dB5r1IrE9WYqwDq4X/GIehqN/nHw
         j+QiUnY1nHW1Neht40eiY64MUQqXxrWaiylvuB1JlwEUh0Y9/1P9XaGvdELTIHMOG/6H
         VF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        fh=1izy71bHmZ3O8Tq2e9qyJYN+cjSQDzsHL7othM47lC0=;
        b=Cw9+QgsMXXo0dSeWRgr3wAX3S86ATQVpNHE0FlammUqIe7U/booVQ3b1olldSdK5CR
         IZhRmoFWKTavrKd68qaLDRntSpcpIK4sziISm2lDSjnRniiTIa1qrkbfjxmTlOwyuQVO
         DNVgf3bwcXxCP/aYPiQr25ggmpHClexbkM5MSkvjvUuQDsRZM8GUC087m1V7h5spG6ln
         w40ggl8U5uD/eCAaReFN1SW9FpaZpKPZIUa3HUJOu+sW670M1Nr5/Y2hSjr4NUX+faJo
         JK5JzlL2gI8VfnKBqWK7lJjZfQPFmTrblzqjbcUSwXdQ39AFySDsvpfdN3GnfM5F1h5K
         byaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141119; x=1792745919; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        b=pCBhLXzY3Xd8S6pLKkJh/hKdmBdp2Gc5PYIAJwcdkTukCV8XwH8Yv59q3iKcN+6PEG
         bcUXdoqzvAsxLehjfmHlqcw+vv1tysS0w6ui1LscYpicx5V72REvMb7eITdBgCBi0rYD
         P8btnRqfGF659xE5L2lbo2i7+aNX1mplUOyYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141119; x=1792745919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        b=pb+2rGzrfuGEbthk910qUAjdTUJwPHMGij3HTXDVJ7By2S8FCMYWGwy4zyZ4qXQX4h
         MCCCgBSV0F828R2a6aTefImX7Cvrvx4VGWvJcFGYDloQfZd/Kll5fJd/qmpdYIsafUbB
         gU4V7E/tnVu0tRyO6hjzp2q0I1rFJeIwO3SH/DIsEJke+dCKaaYIV7EASlqpAkqhqtUx
         B8Kt83SsPBSZWLcQ8Z+ryx+rt1c+kgWMxDvl8xSwyMDz+ncAi0MY/9xmeWspTj1ncaxV
         zDz9xgrGBRWA0ycG3Pkj3KCgZEEHklaEsndYTjvNId1PNCL0eEm9OfE/MFeXx1csUlYV
         UiRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcKgh6YOqnJJ8/FMRSeDAZ11Bo3w600UAdNEm/y2uvQJ91+op5PrxirFN3iYaLUHg8MjMlJR9SMh67@lists.linux.dev
X-Gm-Message-State: AFq9FYIxcyNUDc+wr17WGbPTgnqYkMOX/ACFOBRbQj+WekNOEvMJFBxD
	VF1v73nQeAipu7s5rMnlWVSQiSmRkvdxFgjaJCR+FfCddViB+qtCC3XILrnbkax9Q4BvWI0Nfyg
	57kgNMj4QYDOeLyjEOM4Rrc8FT68kkfuoVKy9W9ac5A==
X-Gm-Gg: AYBFou1kkLzJ7s1yDXCr1r1stOQnJxr53cKBwItDDio8wxztgtSH5QVwydiI0iVAbKu
	Trda96gRSRj4Vk/wYveBignuO2AyoLbFU+w7a1BBKFs83n+WkbMwMXg87WLb141kCYRWyvGb9qL
	OBBGjnHBaR+t0bLuQqNSKxJERB5E5eVSO/xV06+XfYMjFoWDolZ39H5LjvjyaKia3JVETdU7eVV
	3Cgg5KJwNBrYRGAx4zlLYdExE37JDf/E6NL+WHvA1/L6a/NjYGGXaYzV9Ti43k4Zf5BfupeE5u+
	IUyE3jF0pVbGcHJHwzJHsNsQoa3LZ2PTx7A7gcxQkwUhDYCyUpdpAZP6KLwEpf4C+8SB9OR9DuF
	SVAyd9Sk=
X-Received: by 2002:a05:622a:148d:b0:533:3af3:43b9 with SMTP id
 d75a77b69052e-5359fb3d14amr366334251cf.44.1792141119518; Fri, 16 Oct 2026
 01:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910184424.156341-1-shayba@google.com> <20261014192014.3373048-1-shayba@google.com>
In-Reply-To: <20261014192014.3373048-1-shayba@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:58:28 +0200
X-Gm-Features: AclHuK8gvmL5wAjcEDGO2fjptGYL8jYpJoRVGU7iFqj19SwZtNo9v9Zwvm6lwLk
Message-ID: <CAJfpegu5agxOB7_9zW2u=0AfbLuZvp1o9OaW-A7YLvb==voamQ@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 21:20, Shai Barack <shayba@google.com> wrote:

> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.

Applied, thanks.

Miklos
