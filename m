Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2040960F
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098156; cv=pass; b=LKtJgmBIsKlctY4s5HOSkcZhnFJtU8urO7URfXC4SeHQlsEfwI2l7w2iLpsMcROEJ9WtJqcprVa9Z0/SL0h2l/MEWH4WSjgXl2RLdjXJw0p6k1DJ8vFHUCDD7xcSlKHMPzLgZ7qJwRgAc9ofug2j55iCbiEN+/dNjIKOUSu9xDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098156; c=relaxed/simple;
	bh=J+malEbfLZAyYmT+MJed3IJxO0vMsPQ6ALHa3I8w1qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flLOXDQTY7EX7fErpnRSIeU3Ma7IQ9YD8j14TrNFWkQlHzMwJfXW3hHWUpYLkv0uur8Sbeksp8m0eXzjL2kzQhmP35GPM5fh35G8QF4OOytKHlDyfnEBtJagxN4HGNrpYWvr+ThRY6JbhrrW7ZnrrHLVsF4TnyYvqkLdlls2DnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=hB5CDA1c; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="hB5CDA1c"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-517907feed0so57839801cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 06:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781098154; cv=none;
        d=google.com; s=arc-20240605;
        b=W1tBV9XHMwwVOegpElXjoa/DbHd9ZjoZy1nlaN3qJooxwOIjkCojshW1SbKCtMUYDi
         88tkPxQfZUuwx0niyVYLM8U/1tQfL/Q6Xky5IyZDMCetH1WyLr0gl06FAKcdbRNyHZnw
         71f/1DgN5ZsjJz0L3drhLDV8HfTkqgqYUkqeWv+9SKhg+8hPKbxyhxYjrm95srfeLjMU
         zIwxGuDVeoNQoaTmyRDVxlFkzdIxphniGvgemOGX20rOBjybBn7MYkeSQWdY0/BVKcyD
         NcnyHew9sl/nOu42sdLp86TkhoHmcofCX+BA1MpZPEE62nKWqIQUSsK05e7BUhnofOmV
         9FbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SNLqVn9ZS781YXdAhD6QvOOrHfuXhzpRyQc3CU+ZXkE=;
        fh=QMP8oXjHpc1ZcdBq4fPKWLB09YUntY/L/yeiqYjAZ6M=;
        b=Ep2bLl+C3FSxE2YEScwuDzTk/ahHxrmXW8+egFYcdSyz9WW1aqATAOspmbPvbxaMRc
         dRRyjUQSCr7axUKgTL+o7VIME+w9fqS9YQWZg0EDLDF34JXWfZonHPhX3B/2uQEV2Dw3
         7JTpFWtZdvnLWI8oWGxWC3Z6FZoN2B1K+CYrSr7fxi01e+OKElnmmZ+c4yUHb+oLTk1r
         8HBecDWKQZ9YZlw1uiVm3DhFf+ek8v37xe2pK3pjMUFpLijepY2Eb4vuxDJVMZqSN9YC
         fgD6D5AjskuoLev3EGTVcETuv7D+hJuqtLRPZDqNSrdoz2dIsUBtU3sKvGGLWq0vuwnq
         5Nrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781098154; x=1781702954; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SNLqVn9ZS781YXdAhD6QvOOrHfuXhzpRyQc3CU+ZXkE=;
        b=hB5CDA1c9ErH02Naw1JfSIhaFazJTHu5VJgq8GAd1ATIPuZFIdwD+77g4uwJHpuE5s
         lqT6bGW0/yzWBR9AT9X8iTf3gezoilGbnh5i/NNjME9YJr7kCwxhvEzqkLJnTE6UqhEP
         f9WxgN4oeWl2cYQp8838rEFxaA2e8KOgX7alc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098154; x=1781702954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNLqVn9ZS781YXdAhD6QvOOrHfuXhzpRyQc3CU+ZXkE=;
        b=AwCdmr419FXOy8vwr1SmM7uyDwYXYzgmoSLcFOFqYxV4kfDTcOfy88nkin6j8ynq+n
         yS0AQKV+g9ZKK10683rTrYa5/20VP9M89RCWOKYhHnA8k05WY2EL7bRpL54zxSOPs+U+
         iA6OPS4mY4kNJsJQnoyHbpprueM7Wc+SkPyyxYxIG/G6nys87xz6UQQMoPFgZYIpmmWN
         YO6MK+q9hvznGr/c11VkxOum3AIZ486k9HYeXL2/5buRWeIlOHUllIIt2pxPxSSbUEFg
         Rly8HCF60cWLxcThOAS9neGhVwxnMx07nHwI+5oeJj7f63nyNaPXRictztJD3A2KgId9
         KG1A==
X-Forwarded-Encrypted: i=1; AFNElJ/T8Zzp0FFxNataV70AIXzJXd1NIjpRG7ZmIpoClomRwV5RncWLdMzuXrGybCKkbbvl0fKAgpYLsr/z@lists.linux.dev
X-Gm-Message-State: AOJu0YwlJNahIMGZVgzqXLWOb3VU5P1t4p3aFiyZD6JPOrbPxJStHPFS
	j+LJk99pYUZx1f67MpN55FInJzKS1/nAXMReR+I3LTgMI1tAv6vkop3sHUIfEF7XpmorILGZukG
	2EoU0xL+FgFDqes0qLW1HD6/jzmtBtzX+g4P39Ib1jQ==
X-Gm-Gg: Acq92OFK3zkzdZ1ZZmCN12Q/vMXuGV9XqtqEEZO8Q31NH/Tq3RPI+q93pJ9KRjnKwIL
	VSu3z/OSvl4lYuX5WqKKRmDJiHtRRBQb8JsbIhjOyGkC5wC/W58I+1tzMxF5qxLKScl3TOj8UwE
	NfJH4I/1xWSqSV0s9tk7CJF5vAoiPyLm4nnzfW+FHwLXGy9VXIC56V9N8kQXH2rtejuEepiR4dF
	eqwKKOPnQOh+S2pNDS2pXU5QWVoY5cuxvSdgdzWDAcGmOCFSaZeoswk7R8QiU3j5BxIkjJLDswU
	vyO9Z1ZRrhIaYYw70j4slXu8zsjypg39qyjfC9zXl3QQpWdHGXXkBZcR/HvMHw==
X-Received: by 2002:a05:622a:244:b0:50b:3249:828f with SMTP id
 d75a77b69052e-5179888bf1dmr247350811cf.28.1781098154423; Wed, 10 Jun 2026
 06:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522083805.569007-1-liwang@kylinos.cn>
In-Reply-To: <20260522083805.569007-1-liwang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 15:29:03 +0200
X-Gm-Features: AVVi8Cdu8c8832XfxiTEKSnJxkEiZTaVZWUYQgmqg0KDSHzu84GS5Gq2hYrkWNA
Message-ID: <CAJfpegsn446b3VCbR8jYUBpX_o4qbF1PqivkkERtTSzzKxFncA@mail.gmail.com>
Subject: Re: [PATCH] fuse: use READ_ONCE in fuse_chan_num_background()
To: Li Wang <liwang@kylinos.cn>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 10:38, Li Wang <liwang@kylinos.cn> wrote:
>
> fuse_chan_num_background() is called without holding fch->bg_lock (for
> example from fuse_writepages() to compare against fc->congestion_threshold),
> while fch->num_background is updated under bg_lock in dev.c and dev_uring.c.
> This is the same locked-write/lockless-read pattern already used for
> max_background in fuse_chan_max_background().
>
> Use READ_ONCE() on the read side so that:
>
> - The compiler does not cache or coalesce loads of a value that may change
>   concurrently on another CPU.
> - Prevent KCSAN from reporting an unexpected race.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>

Applied, thanks.

Miklos
