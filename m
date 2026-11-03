Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793735860;
	b=pX7TwAiMokla324DmsjZA2yfWV0Tgl1oXbl49qeoaAsoPdDeaxvx2bJmjnvazNPlS10w
	 CnurkwlEPl9tNxJE6t5UvMeNtVu2HViltbP9/UT4yGJoYVwO8NybUAUVm6ezDwY0A3crr
	 J5NaHsE3AkvOBU0XcXzxu5jrpBvsK/jHIqWN8wLbMUbiXu8LlnveocrlgG4ums/lnnScF
	 cbiuikAxGX5usWhcvqq++D2OVaWgABaeSaFiIm5jiaxRA1EocOyX+fMwJRgk9HK9b1W+4
	 j44ShILs9+K5KEqcms6uPc/D8uYIf+fEY5cGV2dCuVucuJ4vuIz7aiXQRc+Y35XiAIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
	b=wD2U361NAjkRPm56OZY8FryKYJmeBR6eqFjFzoQ/Ha644Awc9vkr4FTxcIjo9btzcHuo
	 /Gh+gT0N076IdTq5SlT1NLUHAB5dux2p3y3/GMx5MhoLlbucTbjAMpzlwDudx1O4drt5i
	 jRAR9ioO4czcDHeuzcIUAyBwBpNfZUvUt/alZJMmLvEq2MjaLI/xexKf2R6W2A38hVUtI
	 N7f2ssKoZsmvsKJdOmoDeNwsVpyw6WN8kGvw62WFKyJfIZq5GXcQBfwScgLrBUncifneZ
	 Fpmgze9gnWraiGwNY1ayj6yaPl0FzqI+/VK+zQyW1pQwjp65e74BGqQcYWEQj/h5Vew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VN/4gUF1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B1606A328
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 19:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E7B1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VN/4gUF1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso40840055e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 03 Nov 2026 11:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793735859; cv=none;
        d=google.com; s=arc-20260327;
        b=Z8B9hsIsH/oVDinbz8WJ1vg231x/6bC3pSWhtYAWN2N9fJi44S8Qz3fjNa8ZMwB3Tn
         boNovoZuyb2uwr9385Q/fH8hu26Chzb0qf6nCEg/tR84SIXJCdSTwEz4KaEVts5LbQLo
         8GOrSO+Z/7B9nFEHlAZNv4x4a94F05AKFIH7JiQs8ygdLErqqioODMsWS96jzAoK22U+
         W+GIj5GoM0jes3PSJ3nzNauaAY/xqgV4yk7WFMGAf/IDKmAssCPczLta0wy9XcdYL0Tg
         /xOZhEaeGJMdLaiU1Zx1nzgAqO94DTHFnRL6dyihnuQxS4qq1jbNFaV4eTSDZmi8bcYU
         Gyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        fh=RNTKKZ3BHk4HXxQ9nYcJnwU3xdCzwRzvsprx2XUJsrU=;
        b=BPe3GMTH55iyFQGgpeeYFcT/ZekgSqIbPlfdmNAqOdneDK1Qz7bPqS0u6wQfRV/+1O
         ZZaVT3jNcVFXXEOySBkpoD6taH9ule8M2nNKG/mFlPK54+XYOtHOym9PO2CgGxuKk+11
         CJzKAK5oovemJ0Fm880C1MAmIwySmG/BXzRZv5hr4U4Mxk8bh3H8PGXSbmSgXQcP/WfZ
         Ql7Oyb5NtW39aZEqlLjjcWXvWI7/gTIgXKLhMlMHSoH99uG15N1Fu9aoMo52RKDDEUuy
         GKt6PekKjOQYXB0mqgAxZhAciWzXVIMa+pWnHD11fzOYovwPIBaSs6hGvGwhpSqbQ+Z+
         Ombg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735859; x=1794340659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        b=VN/4gUF1UT4vaUfyNcQFZ1Twga+jrS25yOTlsla/edUXmNjEH+hTjYnKuh0zKxdWIa
         AZtiKOQbpegh6DLuQjkoVOP7fjsQ6a3BktO61Pw7u+g7/BDh9fS+/t8Y3P8cUrvgGa9n
         iRXtdWWDqeAl0mrIA1tA6JtzmwFekAXzkKNOUr60S909tdmTPScGEHaLfXcXhAQ0sbxz
         dWedpQn5Zk4U4dDjoGO/v06xFv1LFjJGMh9MfiFWvzueLN6dUTx+0yiR4AnSm+vKKiUs
         Ij+GGqfv9B1Axbk2t3EF6jVeA5BeWf1ZiTY7NVXNRlUuPSTFHiqP8RJeTtKYbYgFsyFw
         Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735859; x=1794340659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        b=G/L7yq8zWnkNZ07bbjrhTl/DQTpRlCcpXh2xo0mRdJLeVNo8/Jgt21JQwjrGK4tzb9
         IN23UDwG2ZHlGxhVEWbSb2Qve98SBrxV+qlQpLMISRoUsJcJ22LohDpiDXdvrKH5nXvq
         nQdNICOe/8yI3L1HjRYvSSfMipHB8eqTKl8xoiTUUvEJ46Fl2yh62yPDQb7+PgfmHwi3
         hdRhIWctH0sLisHKzk51HV081duSt+ddG28+9N5ThR454Z7FABJlh9kPN2qwREvF4zCC
         zmS8qAKLjx88zp54q1AnkAMNegL4SaYTb7xj2SR9yGolTh1lCud1xHU4TMvrun1ssl4s
         bEng==
X-Forwarded-Encrypted: i=1; AKwUvBzcYrCQ1b5wI9Qv4epqYCjS3AreHmeBA1GgUcUrajTcUGeAplcmm7HCqOIQ+MbEA5vmMF04t6vuOg64@lists.linux.dev
X-Gm-Message-State: APuU4Z8T/cpg15tTrwHi6ET6w07GPwkfEEafuLiCcuSOGdXnuZJ97ZK0
	xlD0I4w37e8RWinSZFbyI4RLLpGPjVyBmjSFGrc4rnRjIP3qTjB4ssk5B5cHEQ5NvEFyxpx4947
	pWASDU42PD27oj5XwGwJEYzZc8RmAVU4=
X-Gm-Gg: AYBFou1ummTqXQohq5NJOH8cTJ4LYNZ3DrTlNeEFPQlrNjLAfa81jkbYfAo24R6Cc1G
	vHeSt54WPTfT3pZ7SUCgeWLqTkpCQI59uy/cgUHXdgbf6Tm3R2nsPjRSwqsDLqlKFqsDabmKTHA
	iIcyfEtrNqMA5N0hybw2QQL6CKR0SB20hiImzydVC43vuHU6XyyGLVbeM+QkNg6zjZxxtEk4ZZn
	iDnC0dffy+HwHMLDxE2TJ/B05PdVhey+2E9ouhraKXUXShbZzEWtJfUjfdj4+kZCS8aVPJxDYIM
	7x3mmY7u8zqRd7olsfi7qsTYJhRYeu9pKDxhNeEPKjVHoG6EoB8GZIdYGmu8CxfF2a4/uuK/vrp
	wm+ndGLrxtTVuNt5Xve1h2qWMn/mfipp2RoCQ/DVCEPfs0f+FtjbnZdvyobkYw2z2T/smA0FGui
	Spe6gZlK5gLMx1W/Dvrw==
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id
 5b1f17b1804b1-4ac16bc547dmr344461405e9.9.1793735858729; Tue, 03 Nov 2026
 11:57:38 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031070515.3042848-2-thnkslprpt@gmail.com>
In-Reply-To: <20261031070515.3042848-2-thnkslprpt@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 3 Nov 2026 11:57:25 -0800
X-Gm-Features: AclHuK_JytKkKfU5M6CJRcikf8vCv1-AjVOSiBNPYKxP4EvAaHLb1svGn_IQLNI
Message-ID: <CAJnrk1aJ32nWqoSLYBOhh6zhM51BMk5sCJGpZBOtNGj4A0iRUQ@mail.gmail.com>
Subject: Re: [PATCH] mm/page-writeback: avoid unnecessary strictlimit
 background wakeups
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 12:05=E2=80=AFAM Avi Weiss <thnkslprpt@gmail.com> w=
rote:
>
> balance_dirty_pages() includes pages under writeback in
> gdtc->wb_dirty when checking the per-wb background threshold for
> strictlimit BDIs. However, wb_over_bg_thresh() only considers
> reclaimable dirty pages when deciding whether to start more
> background writeback.
>
> This can repeatedly wake the background worker even when there are
> too few dirty pages to write. In a 15-second FUSE writeback test,
> background wakeup requests dropped from 2657 to 682 (74% drop),
> while writeback_start events remained nearly unchanged at 99 and 98.
>
> Check wb_over_bg_thresh() before starting background writeback through
> the strictlimit condition. Leave the global background threshold
> check and the wakeup required for dirty throttling unchanged.
>
> Fixes: 0437906841d0 ("mm: start background writeback based on per-wb thre=
shold for strictlimit BDIs")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  mm/page-writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 499a35473e4f..cb0c58715b93 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -1826,7 +1826,8 @@ static int balance_dirty_pages(struct bdi_writeback=
 *wb,
>
>                 if (!writeback_in_progress(wb) &&
>                     (nr_dirty > gdtc->bg_thresh ||
> -                    (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh)=
))
> +                    (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh =
&&
> +                     wb_over_bg_thresh(wb))))
>                         wb_start_background_writeback(wb);
>

Thanks for the fix. It looks right to me. I think an alternative way
would be to save the wb_reclaimable value computed in
wb_dirty_limits() in struct dirty_throttle_control and just check if
"gdtc->wb_reclaimable > gdtc->wb_bg_thresh" which avoids the extra
wb_over_bg_thresh() calculations (but is slightly less precise for the
memcg case), but I don't think it matters much either way.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
