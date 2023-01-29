defmodule LvtwitterWeb.UserConfirmationInstructionsLive do
  use LvtwitterWeb, :live_view

  alias Lvtwitter.Accounts

  def render(assigns) do
    ~H"""
    <.header>Resend confirmation instructions</.header>

    <div class="form-wrapper">
    <.simple_form :let={f} for={:user} id="resend_confirmation_form" phx-submit="send_instructions">
      <.input field={{f, :email}} type="email" label="Email" required />
      <:actions>
        <.button class="btn btn-full" phx-disable-with="Sending...">Resend confirmation instructions</.button>
      </:actions>
    </.simple_form>
    </div>
    <footer class="footer">
      <p class="footer-links">
        <.link href={~p"/users/register"}>Register</.link>
        |
        <.link href={~p"/users/log_in"}>Log in</.link>
      </p>
    </footer>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("send_instructions", %{"user" => %{"email" => email}}, socket) do
    if user = Accounts.get_user_by_email(email) do
      Accounts.deliver_user_confirmation_instructions(
        user,
        &url(~p"/users/confirm/#{&1}")
      )
    end

    info =
      "If your email is in our system and it has not been confirmed yet, you will receive an email with instructions shortly."

    {:noreply,
     socket
     |> put_flash(:info, info)
     |> redirect(to: ~p"/")}
  end
end
